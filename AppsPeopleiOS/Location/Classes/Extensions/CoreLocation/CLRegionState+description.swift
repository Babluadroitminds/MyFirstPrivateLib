//
//  CLRegionState+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 17/01/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import CoreLocation

// MARK: - CustomStringConvertible
extension CLRegionState: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .unknown:
            return NSLocalizedString("unknown", comment: "CLRegionState.unknown")
        case .inside:
            return NSLocalizedString("inside", comment: "CLRegionState.inside")
        case .outside:
            return NSLocalizedString("outside", comment: "CLRegionState.outside")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension CLRegionState: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .unknown:
            return "It is unknown whether the location is inside or outside of the region."
        case .inside:
            return "The location is inside the given region."
        case .outside:
            return "The location is outside of the given region."
        }
    }

}

// MARK: - CaseIterable
extension CLRegionState: CaseIterable {

    public static var allCases: [CLRegionState] {
        return [ .unknown,
                 .inside,
                 .outside
        ]
    }

}
