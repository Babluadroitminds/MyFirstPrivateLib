//
//  CLAuthorizationStatus+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 16/11/2017.
//  Copyright © 2019 Apps People. All rights reserved.
//

import CoreLocation

// MARK: - CustomStringConvertible
extension CLAuthorizationStatus: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .notDetermined:
            return NSLocalizedString("notDetermined", comment: "CLAuthorizationStatus.notDetermined")
        case .restricted:
            return NSLocalizedString("restricted", comment: "CLAuthorizationStatus.restricted")
        case .denied:
            return NSLocalizedString("denied", comment: "CLAuthorizationStatus.denied")
        case .authorizedAlways:
            return NSLocalizedString("authorizedAlways", comment: "CLAuthorizationStatus.authorizedAlways")
        case .authorizedWhenInUse:
            return NSLocalizedString("authorizedWhenInUse", comment: "CLAuthorizationStatus.authorizedWhenInUse")
        @unknown default:
            assert(false, "CLAuthorizationStatus case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "CLAuthorizationStatus.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension CLAuthorizationStatus: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .notDetermined:
            return "User has not yet made a choice with regards to this application"
        case .restricted:
            return "This application is not authorized to use location services. Due to active restrictions on location services, the user cannot change this status, and may not have personally denied authorization"
        case .denied:
            return "User has explicitly denied authorization for this application, or location services are disabled in Settings."
        case .authorizedAlways:
            return "User has granted authorization to use their location at any time, including monitoring for regions, visits, or significant location changes."
        case .authorizedWhenInUse:
            return """
            User has granted authorization to use their location only when your app is visible to them (it will be made visible to them if you continue to receive location updates while in the background). Authorization to use launch APIs has not been granted.
            """
        @unknown default:
            assert(false, "CLAuthorizationStatus case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "CLAuthorizationStatus.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension CLAuthorizationStatus: CaseIterable {

    public static var allCases: [CLAuthorizationStatus] {
        return [ .notDetermined,
                 .restricted,
                 .denied,
                 .authorizedAlways,
                 .authorizedWhenInUse
        ]
    }

}
