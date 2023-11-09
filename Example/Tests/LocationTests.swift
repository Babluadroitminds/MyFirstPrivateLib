//
//  LocationTests.swift
//  AppsPeopleiOS_Tests
//
//  Created by Olivier Voyer on 02/01/2019.
//  Copyright © 2019 Apps People. All rights reserved.
//

import XCTest
import AppsPeopleiOS

import CoreLocation

class LocationTests: BaseTests {

    // MARK: CLActivityType
    func testCLActivityType() {
        for value in CLActivityType.allCases {
            XCTAssert("\(value)" != String(describing: CLActivityType.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("CLActivityType(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

    // MARK: CLAuthorizationStatus
    func testCLAuthorizationStatus() {
        for value in CLAuthorizationStatus.allCases {
            XCTAssert("\(value)" != String(describing: CLAuthorizationStatus.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("CLAuthorizationStatus(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

    // MARK: CLErrorCode
    func testCLErrorCode() {
        for value in CLError.Code.allCases {
            XCTAssert("\(value)" != String(describing: CLError.Code.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("CLError.Code(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

    // MARK: CLLocationCoordinate2D+getBearing
    func testCLLocationCoordinate2D_getBearing() {
        let testPoint1 = CLLocationCoordinate2D(latitude: -31.9505, longitude: 115.8605)
        let testPoint2 = CLLocationCoordinate2D(latitude: -30.9505, longitude: 115.8605)
        let testPoint3 = CLLocationCoordinate2D(latitude: -32.9505, longitude: 115.8605)
        let testPoint4 = CLLocationCoordinate2D(latitude: -31.9505, longitude: 116.8605)
        XCTAssertEqual(testPoint1.getBearing(between: testPoint1), 0.0)
        XCTAssertEqual(testPoint1.getBearing(between: testPoint2), 0.0)
        XCTAssertEqual(testPoint2.getBearing(between: testPoint1), 180.0)
        XCTAssertEqual(testPoint1.getBearing(between: testPoint3), 180.0)
        XCTAssertEqual(testPoint3.getBearing(between: testPoint1), 0.0)
        let about90Degrees = testPoint1.getBearing(between: testPoint4)
        XCTAssertGreaterThan(about90Degrees, 89.0)
        XCTAssertLessThan(about90Degrees, 91.0)
        let aboutMinus90Degrees = testPoint4.getBearing(between: testPoint1)
        XCTAssertGreaterThan(aboutMinus90Degrees, -91.0)
        XCTAssertLessThan(aboutMinus90Degrees, -89.0)
    }

    // MARK: CLRegionState
    func testCLRegionState() {
        for value in CLRegionState.allCases {
            XCTAssert("\(value)" != String(describing: CLRegionState.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("CLRegionState(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

}
