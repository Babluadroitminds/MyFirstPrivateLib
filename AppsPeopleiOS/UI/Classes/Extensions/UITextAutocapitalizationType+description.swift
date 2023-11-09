//
//  UITextAutocapitalizationType+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 02/07/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

// MARK: - CustomStringConvertible
extension UITextAutocapitalizationType: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .none:
            return NSLocalizedString("none", comment: "UITextAutocapitalizationType.none")
        case .words:
            return NSLocalizedString("words", comment: "UITextAutocapitalizationType.words")
        case .sentences:
            return NSLocalizedString("sentences", comment: "UITextAutocapitalizationType.sentences")
        case .allCharacters:
            return NSLocalizedString("allCharacters", comment: "UITextAutocapitalizationType.allCharacters")
        @unknown default:
            assert(false, "UITextAutocapitalizationType case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UITextAutocapitalizationType.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UITextAutocapitalizationType: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .none:
            return "There is no automatic text capitalization."
        case .words:
            return "Automatic capitalization of the first letter of each word."
        case .sentences:
            return "Automatic capitalization of the first letter of each sentence."
        case .allCharacters:
            return "Automatic capitalization of all characters, such as for entry of two-character state abbreviations for the United States."
        @unknown default:
            assert(false, "UITextAutocapitalizationType case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UITextAutocapitalizationType.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UITextAutocapitalizationType: CaseIterable {

    public static var allCases: [UITextAutocapitalizationType] {
        return [ .none,
                 .words,
                 .sentences,
                 .allCharacters
        ]
    }

}

public extension UITextAutocapitalizationType {

    /// Returns the UITextAutocapitalizationType associated with the specified name.
    ///
    /// - parameter name: The name of the UITextAutocapitalizationType
    /// - returns: The UITextAutocapitalizationType for the specified name, or nil if the name is invalid.
    static func textAutocapitalizationType(named name: String) -> UITextAutocapitalizationType? {
        return allCases.first(where: { $0.description == name })
    }

}
