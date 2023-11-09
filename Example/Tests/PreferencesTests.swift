//
//  PreferencesTests.swift
//  AppsPeopleiOS_Tests
//
//  Created by Olivier Voyer on 02/01/2019.
//  Copyright © 2019 Apps People. All rights reserved.
//

import XCTest
import AppsPeopleiOS

class PreferencesTests: BaseTests {

    let testValue = "Alexander"
    let testKey = "Name"
    let testCustomLocation = "Cheese"

    // MARK: User Defaults Preferences
    func testUserDefaultsPreferences() {
        let userPreferences: PreferenceService? = UserDefaultsPreferenceService(customLocation: testCustomLocation)
        XCTAssertNotNil(userPreferences)
        userPreferences?.save(testValue, forKey: testKey)
        let returnedValue = userPreferences?.string(forKey: testKey)
        XCTAssertNotNil(returnedValue)
        XCTAssertEqual(returnedValue, testValue)
    }

    // MARK: Keychain Storage Preferences
    func testKeychainStoragePreferences() {
        let keychainPreferences: PreferenceService? = KeychainStoragePreferenceService(customLocation: testCustomLocation)
        XCTAssertNotNil(keychainPreferences)
        keychainPreferences?.save(testValue, forKey: testKey)
        let returnedKeychainValue = keychainPreferences?.string(forKey: testKey)
        XCTAssertNotNil(returnedKeychainValue)
        XCTAssertEqual(returnedKeychainValue, testValue)
    }

}
