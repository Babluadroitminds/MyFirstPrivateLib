//
//  UNAlertStyle+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 19/04/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UserNotifications

// MARK: - CustomStringConvertible
extension UNAlertStyle: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .none:
            return NSLocalizedString("none", comment: "UNAlertStyle.none")
        case .banner:
            return NSLocalizedString("banner", comment: "UNAlertStyle.banner")
        case .alert:
            return NSLocalizedString("alert", comment: "UNAlertStyle.alert")
        @unknown default:
            assert(false, "UNAlertStyle case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UNAlertStyle.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UNAlertStyle: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .none:
            return """
            No alert.
            """
        case .banner:
            return """
            Banner alerts.
            Alerts are displayed as a slide-down banner. Banners appear for a short time and then disappear automatically if the user does nothing.
            """
        case .alert:
            return """
            Modal alerts.
            Alerts are displayed in a modal window that must be dismissed explicitly by the user.
            """
        @unknown default:
            assert(false, "UNAlertStyle case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UNAlertStyle.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UNAlertStyle: CaseIterable {

    public static var allCases: [UNAlertStyle] {
        return [ .none,
                 .banner,
                 .alert
        ]
    }

}
