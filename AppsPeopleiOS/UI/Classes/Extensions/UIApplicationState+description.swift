//
//  UIApplicationState+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 16/11/2017.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

// MARK: - CustomStringConvertible
extension UIApplication.State: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .active:
            return NSLocalizedString("active", comment: "UIApplicationState.active")
        case .inactive:
            return NSLocalizedString("inactive", comment: "UIApplicationState.inactive")
        case .background:
            return NSLocalizedString("background", comment: "UIApplicationState.background")
        @unknown default:
            assert(false, "UIApplication.State case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIApplication.State.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UIApplication.State: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .active:
            return "The app is running in the foreground and currently receiving events."
        case .inactive:
            return "The app is running in the foreground but is not receiving events. This might happen as a result of an interruption or because the app is transitioning to or from the background."
        case .background:
            return "The app is running in the background."
        @unknown default:
            assert(false, "UIApplication.State case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIApplication.State.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UIApplication.State: CaseIterable {

    public static var allCases: [UIApplication.State] {
        return [ .active,
                 .inactive,
                 .background
        ]
    }

}
