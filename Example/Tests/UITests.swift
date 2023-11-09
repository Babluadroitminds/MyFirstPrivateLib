//
//  UITests.swift
//  AppsPeopleiOS_Tests
//
//  Created by Olivier Voyer on 02/01/2019.
//  Copyright © 2019 Apps People. All rights reserved.
//

import XCTest
import AppsPeopleiOS

import UIKit
import SafariServices

class UITests: BaseTests {

    // MARK: UIApplicationState
    func testUIApplicationState() {
        for value in UIApplication.State.allCases {
            XCTAssert("\(value)" != String(describing: UIApplication.State.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UIApplicationState(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

    // MARK: UIBackgroundRefreshStatus
    func testUIBackgroundRefreshStatus() {
        for value in UIBackgroundRefreshStatus.allCases {
            XCTAssert("\(value)" != String(describing: UIBackgroundRefreshStatus.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UIBackgroundRefreshStatus(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

    // MARK: UIColor+helpers
    func testUIColor_helpers() {
        let red: CGFloat = randomCGFloat(), green: CGFloat = randomCGFloat(), blue: CGFloat = randomCGFloat(), alpha: CGFloat = randomCGFloat()
        let testColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)

        autoreleasepool {
            let lighterColor = testColor.lighter(by: randomCGFloat())
            var newRed: CGFloat = 0.0, newGreen: CGFloat = 0.0, newBlue: CGFloat = 0.0, newAlpha: CGFloat = 0.0
            XCTAssertTrue(lighterColor.getRed(&newRed, green: &newGreen, blue: &newBlue, alpha: &newAlpha))
            XCTAssertGreaterThanOrEqual(newRed, red)
        }
        autoreleasepool {
            let darkerColor = testColor.darker(by: randomCGFloat())
            var newRed: CGFloat = 0.0, newGreen: CGFloat = 0.0, newBlue: CGFloat = 0.0, newAlpha: CGFloat = 0.0
            XCTAssertTrue(darkerColor.getRed(&newRed, green: &newGreen, blue: &newBlue, alpha: &newAlpha))
            XCTAssertLessThanOrEqual(newRed, red)
        }

        autoreleasepool {
            let percentage = randomCGFloat()
            let adjustedColor = testColor.adjust(by: percentage)
            var newRed: CGFloat = 0.0, newGreen: CGFloat = 0.0, newBlue: CGFloat = 0.0, newAlpha: CGFloat = 0.0
            XCTAssertTrue(adjustedColor.getRed(&newRed, green: &newGreen, blue: &newBlue, alpha: &newAlpha))
            if percentage > 0 {
                XCTAssertGreaterThanOrEqual(newRed, red)
            } else {
                XCTAssertLessThanOrEqual(newRed, red)
            }
        }

        let startColor = UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: randomCGFloat())
        let endColor = UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: randomCGFloat())
        let gradientColor = UIColor.gradient(from: startColor, to: endColor, size: CGSize(width: 1.0, height: 1.0))
        XCTAssertNotNil(gradientColor)
    }

    // MARK: UIDeviceBatteryState
    func testUIDeviceBatteryState() {
        for value in UIDevice.BatteryState.allCases {
            XCTAssert("\(value)" != String(describing: UIDevice.BatteryState.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UIDevice.BatteryState(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

    // MARK: UIKeyboardAppearance
    func testUIKeyboardAppearance() {
        for value in UIKeyboardAppearance.allCases {
            XCTAssert("\(value)" != String(describing: UIKeyboardAppearance.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UIKeyboardAppearance(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
        for value in UIKeyboardAppearance.allCases.map({ $0.description }) {
            XCTAssertNotNil(UIKeyboardAppearance.keyboardAppearance(named: value))
        }
        XCTAssertNil(UIKeyboardAppearance.keyboardAppearance(named: "invalidValue"))
    }

    // MARK: UIKeyboardType
    func testUIKeyboardType() {
        for value in UIKeyboardType.allCases {
            XCTAssert("\(value)" != String(describing: UIKeyboardType.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UIKeyboardType(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
        for value in UIKeyboardType.allCases.map({ $0.description }) {
            XCTAssertNotNil(UIKeyboardType.keyboardType(named: value))
        }
        XCTAssertNil(UIKeyboardType.keyboardType(named: "invalidValue"))
    }

    // MARK: UIReturnKeyType
    func testUIReturnKeyType() {
        for value in UIReturnKeyType.allCases {
            XCTAssert("\(value)" != String(describing: UIReturnKeyType.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UIReturnKeyType(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
        for value in UIReturnKeyType.allCases.map({ $0.description }) {
            XCTAssertNotNil(UIReturnKeyType.returnKeyType(named: value))
        }
        XCTAssertNil(UIReturnKeyType.returnKeyType(named: "invalidValue"))
    }

    // MARK: UITextAutocapitalizationType
    func testUITextAutocapitalizationType() {
        for value in UITextAutocapitalizationType.allCases {
            XCTAssert("\(value)" != String(describing: UITextAutocapitalizationType.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UITextAutocapitalizationType(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
        for value in UITextAutocapitalizationType.allCases.map({ $0.description }) {
            XCTAssertNotNil(UITextAutocapitalizationType.textAutocapitalizationType(named: value))
        }
        XCTAssertNil(UITextAutocapitalizationType.textAutocapitalizationType(named: "invalidValue"))
    }

    // MARK: UITextContentType
    func testUITextContentType() {
        for value in UITextContentType.allCases {
            XCTAssert("\(value)" != String(describing: UITextContentType.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UITextContentType(\(value.rawValue))")
        }
    }

    // MARK: UITextField+nextField
    func testUITextField_nextField() {
        // TODO: UITextField+nextField unit test
        XCTAssert(true)
    }

    // MARK: UIUserInterfaceIdiom
    func testUIUserInterfaceIdiom() {
        for value in UIUserInterfaceIdiom.allCases {
            XCTAssert("\(value)" != String(describing: UIUserInterfaceIdiom.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UIUserInterfaceIdiom(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

    // MARK: UIUserInterfaceLayoutDirection
    func testUIUserInterfaceLayoutDirection() {
        for value in UIUserInterfaceLayoutDirection.allCases {
            XCTAssert("\(value)" != String(describing: UIUserInterfaceLayoutDirection.self))
            // XCTAssertTrue(value is CustomStringConvertible)
            // XCTAssertTrue(value is CustomDebugStringConvertible)
            print("UIUserInterfaceLayoutDirection(\(value.rawValue)):\n- decription: \(value.description)\n- debugDescription: \(value.debugDescription)")
        }
    }

    // MARK: UIView+loadNib
    func testUIView_loadNib() {
        // TODO: UIView+loadNib unit test
        XCTAssert(true)
    }

    // MARK: UIViewController+Overlay
    func testUIViewController_Overlay() {
        // TODO: UIViewController+Overlay unit test
        XCTAssert(true)
    }

    // MARK: UIWindow+newWindow
    func testUIWindow_newWindow() {
        // TODO: UIWindow+newWindow unit test
        XCTAssert(true)
    }

    // MARK: AppsPeopleAlerts
    func testAppsPeopleAlerts() {
        // TODO: AppsPeopleAlerts unit test
        XCTAssert(true)
    }

    // MARK: SegueHandlerType
    func testSegueHandlerType() {
        // TODO: SegueHandlerType unit test
        XCTAssert(true)
    }

    // MARK: StoryboardIdentifiable
    func testStoryboardIdentifiable() {
        // TODO: StoryboardIdentifiable unit test
        XCTAssert(true)
    }

    // MARK: URLManager
    func testURLManager() {
        // TODO: URLManager unit test
        XCTAssert(true)
    }

}

extension UITests {

    private func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }

}
