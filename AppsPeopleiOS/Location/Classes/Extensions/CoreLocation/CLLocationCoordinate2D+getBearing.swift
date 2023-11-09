//
//  CLLocationCoordinate2D+getBearing.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 21/06/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import CoreLocation

/// This extension is providing an helper function to return the bearing to another point
/// https://stackoverflow.com/questions/3925942/cllocation-category-for-calculating-bearing-w-haversine-function
extension CLLocationCoordinate2D {

    /// Return the bearing between two points
    ///
    /// - parameter point: The second point to use for the computation.
    /// - returns: The computed bearing between those two points
    ///
    /// - important: both points must be valid CLLocationCoordinate2D
    public func getBearing(between point: CLLocationCoordinate2D) -> Double {
        return getBearingBetweenTwoPoints(self, point)
    }

}

/// Return the bearing between two points
///
/// - parameter point1: The first point.
/// - parameter point2: The second point.
/// - returns: The computed bearing between those two points
///
/// - important: both points must be valid CLLocationCoordinate2D
public func getBearingBetweenTwoPoints(_ point1: CLLocationCoordinate2D, _ point2: CLLocationCoordinate2D) -> Double {
    precondition(CLLocationCoordinate2DIsValid(point1), "point1 must be a valid CLLocationCoordinate2D")
    precondition(CLLocationCoordinate2DIsValid(point1), "point2 must be a valid CLLocationCoordinate2D")

    let lat1 = degreesToRadians(degrees: point1.latitude)
    let lon1 = degreesToRadians(degrees: point1.longitude)

    let lat2 = degreesToRadians(degrees: point2.latitude)
    let lon2 = degreesToRadians(degrees: point2.longitude)

    let dLon = lon2 - lon1

    let y = sin(dLon) * cos(lat2)
    let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
    let radiansBearing = atan2(y, x)

    return radiansToDegrees(radians: radiansBearing)
}

// Private helpers
private func degreesToRadians(degrees: Double) -> Double { return degrees * .pi / 180.0 }
private func radiansToDegrees(radians: Double) -> Double { return radians * 180.0 / .pi }
