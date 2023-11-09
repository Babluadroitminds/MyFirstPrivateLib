//
//  LocationManager.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 16/11/2017.
//  Copyright © 2019 Apps People. All rights reserved.
//

import CoreLocation
import SwiftLocation

private typealias SLLocationManager = SwiftLocation.LocationManager

/// This class allows to subscribe to location updates.
///
/// Key NSLocationWhenInUseUsageDescription MUST be present in the Info.plist file to use location services on iOS 11
/// For Always access NSLocationAlwaysAndWhenInUseUsageDescription must also be present.
public class LocationManager {

    static var filterOldLocations: Bool = true
    static var filterInvalidLocations: Bool = true

    static var firstLocationAgeFilter: TimeInterval = 10.0

    /// Current authorization status of the location manager
    public class var authorizationStatus: CLAuthorizationStatus {
        switch SLLocationManager.state {
        case .undetermined:
            return .notDetermined
        case .denied:
            return .denied
        case .restricted:
            return .restricted
        case .disabled, .available:
            return CLLocationManager.authorizationStatus()
        }
    }

    // MARK: Requesting Authorizations

    // Manual Request

    /// Determine the best authorization mode based upon Info.plist file
    public class func requestAuthorizationIfNeeded() {
        SLLocationManager.shared.requireUserAuthorization()
    }

    /// Manually request given authorization
    public class func requestAuthorizationIfNeeded(_ authorizationLevel: LocationManagerAuthorizationLevel) {
        SLLocationManager.shared.requireUserAuthorization(authorizationLevel)
    }

    /// Observe Authorization Status Changes
    public class func observeAuthorizationStatusChanges(callback: @escaping AuthorizationDidChangeCallback) -> LocationManagerAuthorizationObserver {
        let observerID = SLLocationManager.shared.onAuthorizationChange.add(callback)
        return LocationManagerAuthorizationObserver(token: observerID)
    }

    /// Stop observing Authorization Status Changes
    public class func stopObservingAuthorizationStatusChanges(observer: LocationManagerAuthorizationObserver) {
        observer.remove()
    }

    /// Stop observing all Authorization Status Changes
    public class func stopObservingAuthorizationStatusChanges() {
        // Remove all observers
        SLLocationManager.shared.onAuthorizationChange.removeAll()
    }

    // MARK: Getting current location
    public class func getCurrentLocation(accuracy: LocationAccuracy, timeout: TimeInterval?, completion: @escaping (Result<CLLocation, SwiftLocation.LocationManager.ErrorReason>) -> Void) -> LocationRequest {
        var timeoutToSet: Timeout.Mode?
        if let timeout = timeout {
            timeoutToSet = Timeout.Mode.delayed(timeout)
        }
        let request = SLLocationManager.shared.locateFromGPS(.oneShot, accuracy: accuracy, timeout: timeoutToSet) { data in
            switch data {
            case .failure(let error):
                completion(Result.failure(error))
            case .success(let location):
                completion(Result.success(location))
            }
        }
        return LocationRequest(request: request)
    }

    // MARK: Subscribing to continuous location updates

    /// Start observing Location Changes
    public class func observeLocationChanges(accuracy: LocationAccuracy, activityType: CLActivityType = .other, onUpdate: @escaping (CLLocation) -> Void, onFailure: @escaping (Error) -> Void) -> LocationTrackingRequest {
        let request = SLLocationManager.shared.locateFromGPS(.continous, accuracy: accuracy, activity: activityType) { data in
            switch data {
            case .failure(let error):
                onFailure(error)
            case .success(let location):
                guard !filterInvalidLocations || location.horizontalAccuracy > 0 else { return }
                guard !filterOldLocations || -location.timestamp.timeIntervalSinceNow < firstLocationAgeFilter else { return }
                onUpdate(location)
            }
        }
        return LocationTrackingRequest(request: request)
    }

    /// Stop observing Location Changes
    public class func stopObservingLocationChanges(observer: LocationTrackingRequest) {
        observer.remove()
    }

}

/// Location authorization level you want to ask to the user
public typealias LocationManagerAuthorizationLevel = CLLocationManager.AuthorizationMode

/// Did Change Auth Closure type
public typealias AuthorizationDidChangeCallback = SwiftLocation.LocationManager.AuthorizationChange

/// Did Change Auth Observer type
public typealias AuthorizationDidChangeObserverID = SwiftLocation.Observers<AuthorizationDidChangeCallback>.ObserverID

/// Desidered accuracy of the request.
/// An abstraction of both the horizontal accuracy and recency of location data.
/// `room` is the highest level of accuracy/recency; `ip` is the lowest level
///
/// - any: inaccurate (>5000 meters, and/or received >10 minutes ago)
/// - city: 5000 meters or better, and received within the last 10 minutes. Lowest accuracy
/// - neighborhood: 1000 meters or better, and received within the last 5 minutes
/// - block: 15 meters or better, and received within the last 15 seconds
/// - house: 100 meters or better, and received within the last 1 minute
/// - room: 5 meters or better, and received within the last 5 seconds. Highest accuracy
public typealias LocationAccuracy = SwiftLocation.LocationManager.Accuracy

/// Observer handle for Location Authorization Status
public class LocationManagerAuthorizationObserver {

    private var token: AuthorizationDidChangeObserverID

    init(token: AuthorizationDidChangeObserverID) {
        self.token = token
    }

    deinit {
        // Remove a specific observer of the onAuthorizationChange
        SLLocationManager.shared.onAuthorizationChange.remove(token)
    }

    public func remove() {
        // Remove a specific observer of the onAuthorizationChange
        SLLocationManager.shared.onAuthorizationChange.remove(token)
    }

}

/// Observer handle for Location Changes
public class LocationRequest {

    private var request: SwiftLocation.LocationRequest

    init(request: SwiftLocation.LocationRequest) {
        self.request = request
    }

    deinit {
        remove()
    }

    public func remove() {
        request.stop()
    }

}

/// Observer handle for Location Changes
public class LocationTrackingRequest: LocationRequest { }

/// Helper class allowing to be notified of location changes
public class LocationTracker {

    private var locations: [CLLocation]
    private var request: LocationTrackingRequest?
    private var timer: Timer?

    public init() {
        locations = []
    }

    deinit {
        stopTracking()
    }

    /// Start tracking Location Changes and call updates every <threshold> values
    public func startTracking(accuracy: LocationAccuracy, activityType: CLActivityType = .other, threshold: UInt = 1, onUpdate: @escaping ([CLLocation]) -> Void, onFailure: @escaping (Error) -> Void) {
        guard request == nil else { return }
        locations.removeAll()
        request = LocationManager.observeLocationChanges(accuracy: accuracy, activityType: activityType, onUpdate: { location in
            // print("New Location: \(location)")
            self.locations.append(location)
            if threshold > 0 && self.locations.count >= threshold {
                let newLocations = Array(self.locations.prefix(Int(threshold)))
                onUpdate(newLocations)
                self.locations.removeFirst(newLocations.count)
            }
        }, onFailure: { error in
            // print("Location Error: \(error)")
            onFailure(error)
        })
    }

    /// Start tracking Location Changes and call regular updates
    public func startTracking(accuracy: LocationAccuracy, activityType: CLActivityType = .other, updateInterval: TimeInterval, onUpdate: @escaping ([CLLocation]) -> Void, onFailure: @escaping (Error) -> Void) {
        startTracking(accuracy: accuracy, activityType: activityType, threshold: 0, onUpdate: { _ in }, onFailure: onFailure)
        if updateInterval > 0.0 {
            timer = Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { _ in
                onUpdate(self.locations)
                self.locations.removeAll()
            }
        }
    }

    /// Stop tracking Location Changes
    public func stopTracking() {
        guard let request = request else { return }
        LocationManager.stopObservingLocationChanges(observer: request)
        self.request = nil
        timer?.invalidate()
        self.timer = nil
    }

}
