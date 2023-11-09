//
//  UIDeviceBatteryState+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 16/11/2017.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

// MARK: - CustomStringConvertible
extension UIDevice.BatteryState: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .unknown:
            return NSLocalizedString("unknown", comment: "UIDeviceBatteryState.unknown")
        case .unplugged:
            return NSLocalizedString("unplugged", comment: "UIDeviceBatteryState.unplugged")
        case .charging:
            return NSLocalizedString("charging", comment: "UIDeviceBatteryState.charging")
        case .full:
            return NSLocalizedString("full", comment: "UIDeviceBatteryState.full")
        @unknown default:
            assert(false, "UIDevice.BatteryState case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIDevice.BatteryState.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension UIDevice.BatteryState: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .unknown:
            return "Unknown"
        case .unplugged:
            return "On battery, discharging"
        case .charging:
            return "Plugged in, less than 100%"
        case .full:
            return "Plugged in, at 100%"
        @unknown default:
            assert(false, "UIDevice.BatteryState case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "UIDevice.BatteryState.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension UIDevice.BatteryState: CaseIterable {

    public static var allCases: [UIDevice.BatteryState] {
        return [ .unknown,
                 .unplugged,
                 .charging,
                 .full
        ]
    }

}
