//
//  ErrorReason+LocalizedError.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 03/10/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import SwiftLocation

extension SwiftLocation.LocationManager.ErrorReason: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .cancelled: return "cancelled"
        case .timeout(let timeout): return "timedout(\(timeout))"
        case .invalidAuthStatus(let status): return "invalidAuthStatus(\(status))"
        case .generic(let message): return "generic(\(message))"
        case .noData(let url): return "noData(\(url?.description ?? "nil"))"
        case .missingAPIKey: return "missingAPIKey"
        case .requiredLocationNotFound(let timeout, let last): return "requiredLocationNotFound(timeout: \(timeout), last: \(last?.description ?? "nil"))"
        case .requiredBeaconsNotFound(let timeout, let last): return "requiredBeaconsNotFound(timeout: \(timeout), last: \(last?.description ?? "nil"))"
        }
    }

    public var failureReason: String? {
        switch self {
        case .cancelled: return "Operation was cancelled by the user."
        case .timeout: return "Timeout reached."
        case .invalidAuthStatus: return "Invalid authorization status."
        case .generic: return "Generic error."
        case .noData: return "No data received from service."
        case .missingAPIKey: return "Missing required api key for service."
        case .requiredLocationNotFound: return "Required accurated location were not found, last found reported."
        case .requiredBeaconsNotFound: return "Required beacons were not found, last found reported."
        }
    }

}
