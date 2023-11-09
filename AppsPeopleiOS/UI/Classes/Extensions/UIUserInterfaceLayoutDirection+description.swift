//
//  UIUserInterfaceLayoutDirection+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 16/11/2017.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

// MARK: - CustomStringConvertible
extension UIUserInterfaceLayoutDirection: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .leftToRight:
            return NSLocalizedString("leftToRight", comment: "UIUserInterfaceLayoutDirection.leftToRight")
        case .rightToLeft:
            return NSLocalizedString("rightToLeft", comment: "UIUserInterfaceLayoutDirection.rightToLeft")
        @unknown default:
            assert(false, "UIUserInterfaceLayoutDirection case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIUserInterfaceLayoutDirection.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UIUserInterfaceLayoutDirection: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .leftToRight:
            return """
            The layout direction is left to right.
            """
        case .rightToLeft:
            return """
            The layout direction right to left. This value is appropriate when running with localizations such as Arabic or Hebrew that should have the user interface layout origin on the right edge of the coordinate system.
            """
        @unknown default:
            assert(false, "UIUserInterfaceLayoutDirection case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIUserInterfaceLayoutDirection.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UIUserInterfaceLayoutDirection: CaseIterable {

    public static var allCases: [UIUserInterfaceLayoutDirection] {
        return [ .leftToRight,
                 .rightToLeft
        ]
    }

}
