//
//  UNAuthorizationStatus+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 19/04/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UserNotifications

// MARK: - CustomStringConvertible
extension UNAuthorizationStatus: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .notDetermined:
            return NSLocalizedString("notDetermined", comment: "UNAuthorizationStatus.notDetermined")
        case .denied:
            return NSLocalizedString("denied", comment: "UNAuthorizationStatus.denied")
        case .authorized:
            return NSLocalizedString("authorized", comment: "UNAuthorizationStatus.authorized")
        case .provisional:
            return NSLocalizedString("provisional", comment: "UNAuthorizationStatus.provisional")
        @unknown default:
            assert(false, "UNAuthorizationStatus case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UNAuthorizationStatus.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UNAuthorizationStatus: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .notDetermined:
            return "The user hasn't yet made a choice about whether the app is allowed to schedule notifications."
        case .denied:
            return "The app isn't authorized to schedule or receive notifications."
        case .authorized:
            return "The app is authorized to schedule or receive notifications."
        case .provisional:
            return "The application is provisionally authorized to post noninterruptive user notifications."
        @unknown default:
            assert(false, "UNAuthorizationStatus case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UNAuthorizationStatus.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UNAuthorizationStatus: CaseIterable {

    public static var allCases: [UNAuthorizationStatus] {
        var validValues: [UNAuthorizationStatus] = [
            .notDetermined,
            .denied,
            .authorized
        ]
        if #available(iOS 12.0, *) {
            validValues += [
                .provisional
            ]
        }
        return validValues
    }

}
