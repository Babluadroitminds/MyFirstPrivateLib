//
//  PreferenceService.swift
//  AppsPeopleiOS
//
//  Created by Alexander Karan on 16/10/18.
//  Copyright © 2019 Apps People. All rights reserved.
//

import Foundation

/// This Protocol allows you to easily create a service for storing small usage preferences/settings/keys.
///
/// KeychainStoragePreferenceService stores date in the device keychain.
/// UserDefaultsPreferenceService stores date in user defaults.
public protocol PreferenceService {

    /// Initialize your preferences services location for storing keys either using a default location on disk
    ///
    /// Stores the keys in the location using the bundleId
    init()

    /// Initialize your preferences services location for storing keys either using a custom location on disk
    ///
    /// Returns nil if it fails to initialise a preference service in the desired location
    ///
    /// - parameter location: Default uses projects bundle id.
    init?(customLocation: String)

    /// Returns the String associated with the specified key.
    ///
    /// The returned String is immutable, even if the value you originally set was a mutable String.
    ///
    /// - parameter forKey: A key in the current preference database.
    /// - returns: The String associated with the specified key. Returns nil if the default does not exist or is not a String.
    func string(forKey key: String) -> String?

    /// Returns the Int associated with the specified key.
    ///
    /// The returned Int is immutable, even if the value you originally set was a mutable Int.
    ///
    /// - parameter forKey: A key in the current preference database.
    /// - returns: The Int associated with the specified key. Returns nil if the default does not exist or is not a Int.
    func int(forKey key: String) -> Int?

    /// Returns the Float associated with the specified key.
    ///
    /// The returned Float is immutable, even if the value you originally set was a mutable Float.
    ///
    /// - parameter forKey: A key in the current preference database.
    /// - returns: The Float associated with the specified key. Returns nil if the default does not exist or is not a Float.
    func float(forKey key: String) -> Float?

    /// Returns the Double associated with the specified key.
    ///
    /// The returned Double is immutable, even if the value you originally set was a mutable Double.
    ///
    /// - parameter forKey: A key in the current preference database.
    /// - returns: The Double associated with the specified key. Returns nil if the default does not exist or is not a Double.
    func double(forKey key: String) -> Double?

    /// Returns the Bool associated with the specified key.
    ///
    /// The returned Bool is immutable, even if the value you originally set was a mutable Bool.
    ///
    /// - parameter forKey: A key in the current preference database.
    /// - returns: The Bool associated with the specified key. Returns nil if the default does not exist or is not a Bool.
    func bool(forKey key: String) -> Bool?

    /// Returns the Url associated with the specified key.
    ///
    /// The returned Url is immutable, even if the value you originally set was a mutable Url.
    ///
    /// - parameter forKey: A key in the current preference database.
    /// - returns: The Url associated with the specified key. Returns nil if the default does not exist or is not a Url.
    func url(forKey key: String) -> URL?

    /// Returns the Data associated with the specified key.
    ///
    /// The returned Data is immutable, even if the value you originally set was a mutable Data.
    ///
    /// - parameter forKey: A key in the current preference database.
    /// - returns: The Data associated with the specified key. Returns nil if the default does not exist or is not a Data.
    func data(forKey key: String) -> Data?

    /// Sets the value of the specified default key to the specified String value.
    ///
    /// - parameter value: The String value to store in the preference database.
    /// - parameter forKey: The key with which to associate the value.
    func save(_ value: String, forKey key: String)

    /// Sets the value of the specified default key to the specified Int value.
    ///
    /// - parameter value: The Int value to store in the preference database.
    /// - parameter forKey: The key with which to associate the value.
    func save(_ value: Int, forKey key: String)

    /// Sets the value of the specified default key to the specified Float value.
    ///
    /// - parameter value: The Float value to store in the preference database.
    /// - parameter forKey: The key with which to associate the value.
    func save(_ value: Float, forKey key: String)

    /// Sets the value of the specified default key to the specified Double value.
    ///
    /// - parameter value: The Double value to store in the preference database.
    /// - parameter forKey: The key with which to associate the value.
    func save(_ value: Double, forKey key: String)

    /// Sets the value of the specified default key to the specified Bool value.
    ///
    /// - parameter value: The Bool value to store in the preference database.
    /// - parameter forKey: The key with which to associate the value.
    func save(_ value: Bool, forKey key: String)

    /// Sets the value of the specified default key to the specified Url value.
    ///
    /// - parameter value: The Url value to store in the preference database.
    /// - parameter forKey: The key with which to associate the value.
    func save(_ value: URL, forKey key: String)

    /// Sets the value of the specified default key to the specified Data value.
    ///
    /// - parameter value: The Data value to store in the preference database.
    /// - parameter forKey: The key with which to associate the value.
    func save(_ value: Data, forKey key: String)

    /// Removes the value of the specified default key from the preference database.
    ///
    /// - parameter forKey: A key in the current preference database.
    func removeObject(forKey key: String)
}
