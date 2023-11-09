//
//  UIReturnKeyType+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 29/01/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

// MARK: - CustomStringConvertible
extension UIReturnKeyType: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .default:
            return NSLocalizedString("default", comment: "UIReturnKeyType.default")
        case .go:
            return NSLocalizedString("go", comment: "UIReturnKeyType.go")
        case .google:
            return NSLocalizedString("google", comment: "UIReturnKeyType.google")
        case .join:
            return NSLocalizedString("join", comment: "UIReturnKeyType.join")
        case .next:
            return NSLocalizedString("next", comment: "UIReturnKeyType.next")
        case .route:
            return NSLocalizedString("route", comment: "UIReturnKeyType.route")
        case .search:
            return NSLocalizedString("search", comment: "UIReturnKeyType.search")
        case .send:
            return NSLocalizedString("send", comment: "UIReturnKeyType.send")
        case .yahoo:
            return NSLocalizedString("yahoo", comment: "UIReturnKeyType.yahoo")
        case .done:
            return NSLocalizedString("done", comment: "UIReturnKeyType.done")
        case .emergencyCall:
            return NSLocalizedString("emergencyCall", comment: "UIReturnKeyType.emergencyCall")
        case .continue:
            return NSLocalizedString("continue", comment: "UIReturnKeyType.continue")
        @unknown default:
            assert(false, "UIReturnKeyType case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIReturnKeyType.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UIReturnKeyType: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .default:
            return "The visible title of the Return key is “return”."
        case .go:
            return "The visible title of the Return key is “Go”."
        case .google:
            return "The visible title of the Return key is “Google”."
        case .join:
            return "The visible title of the Return key is “Join”."
        case .next:
            return "The visible title of the Return key is “Next”."
        case .route:
            return "The visible title of the Return key is “Route”."
        case .search:
            return "The visible title of the Return key is “Search”."
        case .send:
            return "The visible title of the Return key is “Send”."
        case .yahoo:
            return "The visible title of the Return key is “Yahoo”."
        case .done:
            return "The visible title of the Return key is “Done”."
        case .emergencyCall:
            return "The visible title of the Return key is “Emergency Call”."
        case .continue:
            return "The visible title of the Return key is “Continue”."
        @unknown default:
            assert(false, "UIReturnKeyType case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIReturnKeyType.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UIReturnKeyType: CaseIterable {

    public static var allCases: [UIReturnKeyType] {
        return [ .default,
                 .go,
                 .google,
                 .join,
                 .next,
                 .route,
                 .search,
                 .send,
                 .yahoo,
                 .done,
                 .emergencyCall,
                 .continue
        ]
    }

}

public extension UIReturnKeyType {

    /// Returns the UIReturnKeyType associated with the specified name.
    ///
    /// - parameter name: The name of the UIReturnKeyType
    /// - returns: The UIReturnKeyType for the specified name, or nil if the name is invalid.
    static func returnKeyType(named name: String) -> UIReturnKeyType? {
        return allCases.first(where: { $0.description == name })
    }

}
