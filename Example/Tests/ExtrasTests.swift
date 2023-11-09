//
//  ExtrasTests.swift
//  AppsPeopleiOS_Tests
//
//  Created by Olivier Voyer on 02/01/2019.
//  Copyright © 2019 Apps People. All rights reserved.
//

import XCTest
import AppsPeopleiOS

import AKSideMenu
// import FirebaseRemoteConfig
import SwiftLocation

class ExtrasTests: BaseTests {

    // MARK: AKSideMenuStoryboardSegue
    let sourceViewController = UIViewController()
    lazy var sideMenu: AKSideMenu = {
        return AKSideMenu(contentViewController: sourceViewController, leftMenuViewController: nil, rightMenuViewController: nil)
    }()
    func testAKSideMenuStoryboardSegue() {
        let targetViewController = UIViewController()
        let window = UIWindow()
        window.rootViewController = sideMenu
        window.makeKeyAndVisible()

        let segue = AKSideMenuSetViewControllerSegue(identifier: "TestSegue", source: sourceViewController, destination: targetViewController)
        UIView.setAnimationsEnabled(false)
        segue.perform()
        XCTAssertEqual(sideMenu.contentViewController, targetViewController)
    }

    // MARK: RemoteConfigFetchStatus
    /*func testRemoteConfigFetchStatus() {
        for value in RemoteConfigFetchStatus.allCases {
            XCTAssert("\(value)" != String(describing: RemoteConfigFetchStatus.self))
            //XCTAssertTrue(value is CustomStringConvertible)
            //XCTAssertTrue(value is CustomDebugStringConvertible)
            print("RemoteConfigFetchStatus(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }*/

    // MARK: WebSocket+Codable
    func testWebSocket_Codable() {
        // TODO: WebSocket+Codable unit test
        XCTAssert(true)
    }

    // MARK: SwiftLocation.LocationError
    func testLocationError() {
        for value in [ SwiftLocation.LocationManager.ErrorReason.cancelled,
                       SwiftLocation.LocationManager.ErrorReason.timeout(10.0),
                       SwiftLocation.LocationManager.ErrorReason.invalidAuthStatus(.notDetermined),
                       SwiftLocation.LocationManager.ErrorReason.generic("testMessage"),
                       SwiftLocation.LocationManager.ErrorReason.noData(nil),
                       SwiftLocation.LocationManager.ErrorReason.missingAPIKey,
                       SwiftLocation.LocationManager.ErrorReason.requiredLocationNotFound(timeout: 10.0, last: nil) ] {
                        XCTAssert("\(value)" != String(describing: SwiftLocation.LocationManager.ErrorReason.self))
                        // XCTAssertTrue(value is CustomStringConvertible)
                        // XCTAssertTrue(value is CustomDebugStringConvertible)
                        print("SwiftLocation.LocationError(\(value)):\n- errorDescription: \(String(describing: value.errorDescription))\n- failureReason: \(String(describing: value.failureReason))")
        }
    }

    // MARK: LocationManager
    func testLocationManager() {
        // TODO: LocationManager unit test
        XCTAssert(true)
    }

}
