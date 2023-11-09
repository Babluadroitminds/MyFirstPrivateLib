//
//  CLErrorCode+description.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 28/09/2020.
//

import CoreLocation

// MARK: - CustomStringConvertible
extension CLError.Code: CustomStringConvertible {

    /// The textual representation used when written to an output stream
    public var description: String {
        switch self {
        case .locationUnknown:
            return NSLocalizedString("locationUnknown", comment: "CLError.Code.locationUnknown")
        case .denied:
            return NSLocalizedString("denied", comment: "CLError.Code.denied")
        case .network:
            return NSLocalizedString("network", comment: "CLError.Code.network")
        case .headingFailure:
            return NSLocalizedString("headingFailure", comment: "CLError.Code.headingFailure")
        case .regionMonitoringDenied:
            return NSLocalizedString("regionMonitoringDenied", comment: "CLError.Code.regionMonitoringDenied")
        case .regionMonitoringFailure:
            return NSLocalizedString("regionMonitoringFailure", comment: "CLError.Code.regionMonitoringFailure")
        case .regionMonitoringSetupDelayed:
            return NSLocalizedString("regionMonitoringSetupDelayed", comment: "CLError.Code.regionMonitoringSetupDelayed")
        case .regionMonitoringResponseDelayed:
            return NSLocalizedString("regionMonitoringResponseDelayed", comment: "CLError.Code.regionMonitoringResponseDelayed")
        case .geocodeFoundNoResult:
            return NSLocalizedString("geocodeFoundNoResult", comment: "CLError.Code.geocodeFoundNoResult")
        case .geocodeFoundPartialResult:
            return NSLocalizedString("geocodeFoundPartialResult", comment: "CLError.Code.geocodeFoundPartialResult")
        case .geocodeCanceled:
            return NSLocalizedString("geocodeCanceled", comment: "CLError.Code.geocodeCanceled")
        case .deferredFailed:
            return NSLocalizedString("deferredFailed", comment: "CLError.Code.deferredFailed")
        case .deferredNotUpdatingLocation:
            return NSLocalizedString("deferredNotUpdatingLocation", comment: "CLError.Code.deferredNotUpdatingLocation")
        case .deferredAccuracyTooLow:
            return NSLocalizedString("deferredAccuracyTooLow", comment: "CLError.Code.deferredAccuracyTooLow")
        case .deferredDistanceFiltered:
            return NSLocalizedString("deferredDistanceFiltered", comment: "CLError.Code.deferredDistanceFiltered")
        case .deferredCanceled:
            return NSLocalizedString("deferredCanceled", comment: "CLError.Code.deferredCanceled")
        case .rangingUnavailable:
            return NSLocalizedString("rangingUnavailable", comment: "CLError.Code.rangingUnavailable")
        case .rangingFailure:
            return NSLocalizedString("rangingFailure", comment: "CLError.Code.rangingFailure")
        case .promptDeclined:
            return NSLocalizedString("promptDeclined", comment: "CLError.Code.promptDeclined")
        @unknown default:
            assert(false, "CLError.Code case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "CLError.Code.unknownCase")
        }
    }

}

// MARK: - CustomDebugStringConvertible
extension CLError.Code: CustomDebugStringConvertible {

    /// The debug textual representation used when written to an output stream
    public var debugDescription: String {
        switch self {
        case .locationUnknown:
            return "The location manager was unable to obtain a location value right now."
        case .denied:
            return "The user denied access to the location service."
        case .network:
            return "The network was unavailable or a network error occurred."
        case .headingFailure:
            return "The heading could not be determined."
        case .regionMonitoringDenied:
            return "The user denied access to the region monitoring service."
        case .regionMonitoringFailure:
            return "A registered region cannot be monitored."
        case .regionMonitoringSetupDelayed:
            return "Core Location could not initialize the region monitoring feature immediately."
        case .regionMonitoringResponseDelayed:
            return " Core Location will deliver events but they may be delayed."
        case .geocodeFoundNoResult:
            return "The geocode request yielded no result."
        case .geocodeFoundPartialResult:
            return "The geocode request yielded a partial result."
        case .geocodeCanceled:
            return "The geocode request was canceled."
        case .deferredFailed:
            return "The location manager did not enter deferred mode for an unknown reason."
        case .deferredNotUpdatingLocation:
            return "The location manager didn’t enter deferred mode because location updates were already disabled or paused."
        case .deferredAccuracyTooLow:
            return "Deferred mode is not supported for the requested accuracy."
        case .deferredDistanceFiltered:
            return "Deferred mode does not support distance filters."
        case .deferredCanceled:
            return "The app or the location manager canceled the request for deferred updates."
        case .rangingUnavailable:
            return "Ranging is disabled."
        case .rangingFailure:
            return "A general ranging error occurred."
        case .promptDeclined:
            return "The user didn’t grant the requested temporary authorization."
        @unknown default:
            assert(false, "CLError.Code case \(self.rawValue) not handled")
            return NSLocalizedString("unknown", comment: "CLError.Code.unknownCase")
        }
    }

}

// MARK: - CaseIterable
extension CLError.Code: CaseIterable {

    public static var allCases: [CLError.Code] {
        return [ .locationUnknown,
                 .denied,
                 .network,
                 .headingFailure,
                 .regionMonitoringDenied,
                 .regionMonitoringFailure,
                 .regionMonitoringSetupDelayed,
                 .regionMonitoringResponseDelayed,
                 .geocodeFoundNoResult,
                 .geocodeFoundPartialResult,
                 .geocodeCanceled,
                 .deferredFailed,
                 .deferredNotUpdatingLocation,
                 .deferredAccuracyTooLow,
                 .deferredDistanceFiltered,
                 .deferredCanceled,
                 .rangingUnavailable,
                 .rangingFailure,
                 .promptDeclined
        ]
    }

}
