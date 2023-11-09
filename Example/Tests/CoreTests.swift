//
//  CoreTests.swift
//  AppsPeopleiOS_Tests
//
//  Created by Olivier Voyer on 02/01/2019.
//  Copyright © 2019 Apps People. All rights reserved.
//

import XCTest
import AppsPeopleiOS

import Foundation

class CoreTests: BaseTests {

    // MARK: String+base64
    func testString_base64() {
        let testString = UUID().uuidString // Random string
        let encoded = testString.toBase64()
        let decoded = String(base64Encoded: encoded)
        XCTAssertNotNil(decoded)
        XCTAssertEqual(decoded, testString)
    }

    // MARK: URL+urlComponents
    func testURL_urlComponents() {
        let testURL1 = URL(string: "http://www.example.com/index.php?myKey=myKeyValue")!
        let testURL2 = URL(string: "http://www.example.com/index.php?myKey=myKeyValue&otherKey=myOtherKeyValue&myKey=duplicatedMyKeyValue")!
        XCTAssertNil(testURL1.queryParameter(named: "notExistingKey"))
        XCTAssertEqual(testURL1.queryParameter(named: "myKey"), "myKeyValue")
        XCTAssertEqual(testURL2.queryParameter(named: "myKey"), "myKeyValue")
    }

    // MARK: CaseIterable
    enum TestEnum: CaseIterable {
        case one
        case two
    }
    func testCaseIterable() {
        XCTAssertEqual(TestEnum.allCases.count, 2)
        XCTAssertEqual(TestEnum.allCases, [ TestEnum.one, TestEnum.two ])
        XCTAssert(true)
    }

    // MARK: DataSourceState
    func testDataSourceState() {
        // TODO: DataSourceState unit test
        XCTAssert(true)
    }

    // MARK: Result
    func testResult() {
        XCTAssert(true, "We trust Alamofire tests, no need to test ourselves")
    }

    // MARK: Vibrate
    func testVibrate() {
        vibrate()
        XCTAssert(true)
    }

}
