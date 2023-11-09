//
//  RemoteConfigFetchStatus+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 22/07/2019.
//  Copyright © 2019 Apps People Pty Ltd. All rights reserved.
//

import FirebaseRemoteConfig

// MARK: - CustomStringConvertible
extension RemoteConfigFetchStatus: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .noFetchYet:
            return NSLocalizedString("noFetchYet", comment: "RemoteConfigFetchStatus.noFetchYet")
        case .success:
            return NSLocalizedString("success", comment: "RemoteConfigFetchStatus.success")
        case .failure:
            return NSLocalizedString("failure", comment: "RemoteConfigFetchStatus.failure")
        case .throttled:
            return NSLocalizedString("throttled", comment: "RemoteConfigFetchStatus.throttled")
        @unknown default:
            assert(false, "RemoteConfigFetchStatus case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "RemoteConfigFetchStatus.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension RemoteConfigFetchStatus: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .noFetchYet:
            return "Config has never been fetched."
        case .success:
            return "Config fetch succeeded."
        case .failure:
            return "Config fetch failed."
        case .throttled:
            return "Config fetch was throttled."
        @unknown default:
            assert(false, "RemoteConfigFetchStatus case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "RemoteConfigFetchStatus.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension RemoteConfigFetchStatus: CaseIterable {

    public static var allCases: [RemoteConfigFetchStatus] {
        return [
            .noFetchYet,
            .success,
            .failure,
            .throttled
        ]
    }

}
