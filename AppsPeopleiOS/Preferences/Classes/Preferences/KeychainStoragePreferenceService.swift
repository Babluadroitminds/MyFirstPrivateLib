//
//  KeychainStoragePreferenceService.swift
//  AppsPeopleiOS
//
//  Created by Alexander Karan on 16/10/18.
//  Copyright © 2019 Apps People. All rights reserved.
//

import Foundation
import KeychainAccess

public class KeychainStoragePreferenceService: PreferenceService {

    private let keychain: Keychain

    public required init() {
        // This will never fail as Xcode require a valid bundleId to run the app
        self.keychain = Keychain(service: Bundle.main.bundleIdentifier!)
    }

    public required init?(customLocation: String) {
        self.keychain = Keychain(service: customLocation)
    }

    public func string(forKey key: String) -> String? {
        return keychain[key]
    }

    public func int(forKey key: String) -> Int? {
        guard let value = keychain[key] else { return nil }
        return Int(value)
    }

    public func float(forKey key: String) -> Float? {
        guard let value = keychain[key] else { return nil }
        return Float(value)
    }

    public func double(forKey key: String) -> Double? {
        guard let value = keychain[key] else { return nil }
        return Double(value)
    }

    public func bool(forKey key: String) -> Bool? {
        guard let value = keychain[key] else { return nil }
        return Bool(value)
    }

    public func url(forKey key: String) -> URL? {
        guard let value = keychain[key] else { return nil }
        return URL(string: value)
    }

    public func data(forKey key: String) -> Data? {
        return keychain[data: key]
    }

    public func save(_ value: String, forKey key: String) {
        keychain[key] = value
    }

    public func save(_ value: Int, forKey key: String) {
        keychain[key] = String(value)
    }

    public func save(_ value: Float, forKey key: String) {
        keychain[key] = String(value)
    }

    public func save(_ value: Double, forKey key: String) {
        keychain[key] = String(value)
    }

    public func save(_ value: Bool, forKey key: String) {
        keychain[key] = String(value)
    }

    public func save(_ value: URL, forKey key: String) {
        keychain[key] = value.absoluteString
    }

    public func save(_ value: Data, forKey key: String) {
        keychain[data: key] = value
    }

    public func removeObject(forKey key: String) {
        keychain[key] = nil
    }
}
