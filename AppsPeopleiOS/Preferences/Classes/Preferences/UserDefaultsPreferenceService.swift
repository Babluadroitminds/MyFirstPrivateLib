//
//  UserDefaultsPreferenceService.swift
//  AppsPeopleiOS
//
//  Created by Alexander Karan on 16/10/18.
//  Copyright © 2019 Apps People. All rights reserved.
//

import Foundation

public class UserDefaultsPreferenceService: PreferenceService {

    private let userDefaults: UserDefaults

    public required init() {
        // This will never fail as Xcode require a valid bundleId to run the app
        self.userDefaults = UserDefaults(suiteName: Bundle.main.bundleIdentifier!)!
    }

    public required init?(customLocation: String) {
        guard let defaults = UserDefaults(suiteName: customLocation) else { return nil }
        self.userDefaults = defaults
    }

    public func string(forKey key: String) -> String? {
        return userDefaults.string(forKey: key)
    }

    public func int(forKey key: String) -> Int? {
        return userDefaults.value(forKey: key) as? Int
    }

    public func float(forKey key: String) -> Float? {
        return userDefaults.value(forKey: key) as? Float
    }

    public func double(forKey key: String) -> Double? {
        return userDefaults.value(forKey: key) as? Double
    }

    public func bool(forKey key: String) -> Bool? {
        return userDefaults.value(forKey: key) as? Bool
    }

    public func url(forKey key: String) -> URL? {
        return userDefaults.value(forKey: key) as? URL
    }

    public func data(forKey key: String) -> Data? {
        return userDefaults.value(forKey: key) as? Data
    }

    public func save(_ value: String, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }

    public func save(_ value: Int, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }

    public func save(_ value: Float, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }

    public func save(_ value: Double, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }

    public func save(_ value: Bool, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }

    public func save(_ value: URL, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }

    public func save(_ value: Data, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }

    public func removeObject(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
