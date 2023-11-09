//
//  UNNotificationSetting+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 19/04/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UserNotifications

// MARK: - CustomStringConvertible
extension UNNotificationSetting: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .notSupported:
            return NSLocalizedString("notSupported", comment: "UNNotificationSetting.notSupported")
        case .disabled:
            return NSLocalizedString("disabled", comment: "UNNotificationSetting.disabled")
        case .enabled:
            return NSLocalizedString("enabled", comment: "UNNotificationSetting.enabled")
        @unknown default:
            assert(false, "UNNotificationSetting case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UNNotificationSetting.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UNNotificationSetting: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .notSupported:
            return "The setting is not available to your app."
        case .disabled:
            return "The setting is disabled."
        case .enabled:
            return "The setting is enabled."
        @unknown default:
            assert(false, "UNNotificationSetting case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UNNotificationSetting.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UNNotificationSetting: CaseIterable {

    public static var allCases: [UNNotificationSetting] {
        return [ .notSupported,
                 .disabled,
                 .enabled
        ]
    }

}
