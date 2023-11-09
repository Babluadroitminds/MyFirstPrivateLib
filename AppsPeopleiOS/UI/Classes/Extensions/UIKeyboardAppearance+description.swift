//
//  UIKeyboardAppearance+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 29/01/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

// MARK: - CustomStringConvertible
extension UIKeyboardAppearance: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .default:
            return NSLocalizedString("default", comment: "UIKeyboardAppearance.default")
        case .dark:
            return NSLocalizedString("dark", comment: "UIKeyboardAppearance.dark")
        case .light:
            return NSLocalizedString("light", comment: "UIKeyboardAppearance.light")
        @unknown default:
            assert(false, "UIKeyboardAppearance case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIKeyboardAppearance.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UIKeyboardAppearance: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .default:
            return "The default keyboard appearance for the current input method. This constant corresponds to the light value."
        case .dark:
            return "A keyboard appearance suitable for a dark UI look."
        case .light:
            return "A keyboard appearance suitable for a light UI look."
        @unknown default:
            assert(false, "UIKeyboardAppearance case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIKeyboardAppearance.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UIKeyboardAppearance: CaseIterable {

    public static var allCases: [UIKeyboardAppearance] {
        return [ .default,
                 .dark,
                 .light
        ]
    }

}

public extension UIKeyboardAppearance {

    /// Returns the UIKeyboardAppearance associated with the specified name.
    ///
    /// - parameter name: The name of the UIKeyboardAppearance
    /// - returns: The UIKeyboardAppearance for the specified name, or nil if the name is invalid.
    static func keyboardAppearance(named name: String) -> UIKeyboardAppearance? {
        return allCases.first(where: { $0.description == name })
    }

}
