//
//  UIBackgroundRefreshStatus+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 16/11/2017.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

// MARK: - CustomStringConvertible
extension UIBackgroundRefreshStatus: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .restricted:
            return NSLocalizedString("restricted", comment: "UIBackgroundRefreshStatus.restricted")
        case .denied:
            return NSLocalizedString("denied", comment: "UIBackgroundRefreshStatus.denied")
        case .available:
            return NSLocalizedString("available", comment: "UIBackgroundRefreshStatus.available")
        @unknown default:
            assert(false, "UIBackgroundRefreshStatus case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIBackgroundRefreshStatus.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UIBackgroundRefreshStatus: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .restricted:
            return "Unavailable on this system due to device configuration; the user cannot enable the feature"
        case .denied:
            return "Explicitly disabled by the user for this application"
        case .available:
            return"Enabled for this application"
        @unknown default:
            assert(false, "UIBackgroundRefreshStatus case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIBackgroundRefreshStatus.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UIBackgroundRefreshStatus: CaseIterable {

    public static var allCases: [UIBackgroundRefreshStatus] {
        return [ .restricted,
                 .denied,
                 .available
        ]
    }

}
