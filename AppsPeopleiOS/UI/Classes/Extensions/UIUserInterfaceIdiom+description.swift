//
//  UIUserInterfaceIdiom+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 16/11/2017.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

// MARK: - CustomStringConvertible
extension UIUserInterfaceIdiom: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .unspecified:
            return NSLocalizedString("unspecified", comment: "UIUserInterfaceIdiom.unspecified")
        case .phone:
            return NSLocalizedString("phone", comment: "UIUserInterfaceIdiom.phone")
        case .pad:
            return NSLocalizedString("pad", comment: "UIUserInterfaceIdiom.pad")
        case .tv:
            return NSLocalizedString("tv", comment: "UIUserInterfaceIdiom.tv")
        case .carPlay:
            return NSLocalizedString("carPlay", comment: "UIUserInterfaceIdiom.carPlay")
        case .mac:
            return NSLocalizedString("mac", comment: "UIUserInterfaceIdiom.mac")
        @unknown default:
            assert(false, "UIUserInterfaceIdiom case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIUserInterfaceIdiom.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UIUserInterfaceIdiom: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .unspecified:
            return "Used when an object has a trait collection, but it is not in an environment yet. For example, a view that is created, but not put into a view hierarchy."
        case .phone:
            return "An interface designed for iPhone and iPod touch."
        case .pad:
            return "An interface designed for iPad."
        case .tv:
            return "An interface designed for tvOS and Apple TV."
        case .carPlay:
            return "An interface designed for an in-car experience."
        case .mac:
            return "An interface designed for the Mac."
        @unknown default:
            assert(false, "UIUserInterfaceIdiom case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIUserInterfaceIdiom.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UIUserInterfaceIdiom: CaseIterable {

    public static var allCases: [UIUserInterfaceIdiom] {
        var validValues: [UIUserInterfaceIdiom] = [ .unspecified,
                                                    .phone,
                                                    .pad,
                                                    .tv,
                                                    .carPlay
        ]
        if #available(iOS 14.0, *) {
            validValues += [
                .mac
            ]
        }
        return validValues
    }

}
