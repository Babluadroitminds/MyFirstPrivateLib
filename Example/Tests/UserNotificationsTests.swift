//
//  UserNotificationsTests.swift
//  AppsPeopleiOS_Tests
//
//  Created by Olivier Voyer on 02/01/2019.
//  Copyright © 2019 Apps People. All rights reserved.
//

import XCTest
import AppsPeopleiOS

import UserNotifications

class UserNotificationsTests: BaseTests {

    // MARK: UNAlertStyle
    func testUNAlertStyle() {
        for value in UNAlertStyle.allCases {
            XCTAssert("\(value)" != String(describing: UNAlertStyle.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UNAlertStyle(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

    // MARK: UNAuthorizationStatus
    func testUNAuthorizationStatus() {
        for value in UNAuthorizationStatus.allCases {
            XCTAssert("\(value)" != String(describing: UNAuthorizationStatus.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UNAuthorizationStatus(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

    // MARK: UNNotificationSetting
    func testUNNotificationSetting() {
        for value in UNNotificationSetting.allCases {
            XCTAssert("\(value)" != String(describing: UNAuthorizationStatus.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UNNotificationSetting(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

}
