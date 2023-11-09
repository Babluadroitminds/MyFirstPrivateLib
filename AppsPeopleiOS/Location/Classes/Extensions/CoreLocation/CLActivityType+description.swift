//
//  CLActivityType+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 19/03/2019.
//  Copyright © 2019 Apps People. All rights reserved.
//

import CoreLocation

// MARK: - CustomStringConvertible
extension CLActivityType: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .other:
            return NSLocalizedString("other", comment: "CLActivityType.other")
        case .automotiveNavigation:
            return NSLocalizedString("automotiveNavigation", comment: "CLActivityType.automotiveNavigation")
        case .fitness:
            return NSLocalizedString("fitness", comment: "CLActivityType.fitness")
        case .otherNavigation:
            return NSLocalizedString("otherNavigation", comment: "CLActivityType.otherNavigation")
        case .airborne:
            return NSLocalizedString("airborne", comment: "CLActivityType.airborne")
        @unknown default:
            assert(false, "CLActivityType case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "CLActivityType.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension CLActivityType: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .other:
            return "The location manager is being used for an unknown activity."
        case .automotiveNavigation:
            return "The location manager is being used specifically during vehicular navigation to track location changes to the automobile."
        case .fitness:
            return "The location manager is being used to track fitness activities such as walking, running, cycling, and so on."
        case .otherNavigation:
            return "The location manager is being used to track movements for other types of vehicular navigation that are not automobile related."
        case .airborne:
            return "The location manager is being used specifically during airborne activities."
        @unknown default:
            assert(false, "CLActivityType case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "CLActivityType.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension CLActivityType: CaseIterable {

    public static var allCases: [CLActivityType] {
        var validValues: [CLActivityType] = [ .other,
                                              .automotiveNavigation,
                                              .fitness,
                                              .otherNavigation
        ]
        if #available(iOS 12.0, *) {
            validValues += [
                .airborne
            ]
        }
        return validValues
    }

}
