//
//  UIKeyboardType+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 29/01/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

// MARK: - CustomStringConvertible
extension UIKeyboardType: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .default:
            return NSLocalizedString("default", comment: "UIKeyboardType.default")
        case .asciiCapable:
            return NSLocalizedString("asciiCapable", comment: "UIKeyboardType.asciiCapable")
        case .numbersAndPunctuation:
            return NSLocalizedString("numbersAndPunctuation", comment: "UIKeyboardType.numbersAndPunctuation")
        case .URL:
            return NSLocalizedString("URL", comment: "UIKeyboardType.URL")
        case .numberPad:
            return NSLocalizedString("numberPad", comment: "UIKeyboardType.numberPad")
        case .phonePad:
            return NSLocalizedString("phonePad", comment: "UIKeyboardType.phonePad")
        case .namePhonePad:
            return NSLocalizedString("namePhonePad", comment: "UIKeyboardType.namePhonePad")
        case .emailAddress:
            return NSLocalizedString("emailAddress", comment: "UIKeyboardType.emailAddress")
        case .decimalPad:
            return NSLocalizedString("decimalPad", comment: "UIKeyboardType.decimalPad")
        case .twitter:
            return NSLocalizedString("twitter", comment: "UIKeyboardType.twitter")
        case .webSearch:
            return NSLocalizedString("webSearch", comment: "UIKeyboardType.webSearch")
        case .asciiCapableNumberPad:
            return NSLocalizedString("asciiCapableNumberPad", comment: "UIKeyboardType.asciiCapableNumberPad")
        @unknown default:
            assert(false, "UIKeyboardType case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIKeyboardType.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UIKeyboardType: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .default:
            return "The default keyboard for the current input method."
        case .asciiCapable:
            return "A keyboard that displays standard ASCII characters."
        case .numbersAndPunctuation:
            return "The numbers and punctuation keyboard."
        case .URL:
            return "A keyboard optimized for URL entry. This keyboard type prominently features the period (“.”) and slash (“/”) characters and the “.com” string."
        case .numberPad:
            return "A numeric keypad designed for PIN entry. This keyboard type prominently features the numbers 0 through 9. This keyboard type does not support auto-capitalization."
        case .phonePad:
            return "A keypad designed for entering telephone numbers. This keyboard type prominently features the numbers 0 through 9 and the “*” and “#” characters. This keyboard type does not support auto-capitalization."
        case .namePhonePad:
            return "A keypad designed for entering a person’s name or phone number. This keyboard type does not support auto-capitalization."
        case .emailAddress:
            return "A keyboard optimized for entering email addresses. This keyboard type prominently features the at (“@”), period (“.”) and space characters."
        case .decimalPad:
            return "A keyboard with numbers and a decimal point."
        case .twitter:
            return "A keyboard optimized for Twitter text entry, with easy access to the at (“@”) and hash (“#”) characters."
        case .webSearch:
            return "A keyboard optimized for web search terms and URL entry. This keyboard type prominently features the space and period (“.”) characters."
        case .asciiCapableNumberPad:
            return "A number pad that outputs only ASCII digits."
        @unknown default:
            assert(false, "UIKeyboardType case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIKeyboardType.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UIKeyboardType: CaseIterable {

    public static var allCases: [UIKeyboardType] {
        return [ .default,
                 .asciiCapable,
                 .numbersAndPunctuation,
                 .URL,
                 .numberPad,
                 .phonePad,
                 .namePhonePad,
                 .emailAddress,
                 .decimalPad,
                 .twitter,
                 .webSearch,
                 .asciiCapableNumberPad
        ]
    }

}

public extension UIKeyboardType {

    /// Returns the UIKeyboardType associated with the specified name.
    ///
    /// - parameter name: The name of the UIKeyboardType
    /// - returns: The UIKeyboardType for the specified name, or nil if the name is invalid.
    static func keyboardType(named name: String) -> UIKeyboardType? {
        return allCases.first(where: { $0.description == name })
    }

}
