//
//  UITextContentType+valid.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 16/07/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

// MARK: - CaseIterable
extension UITextContentType: CaseIterable {

    public static var allCases: [UITextContentType] {
        var validValues: [UITextContentType] = [
            .name,
            .namePrefix,
            .givenName,
            .middleName,
            .familyName,
            .nameSuffix,
            .nickname,
            .jobTitle,
            .organizationName,
            .location,
            .fullStreetAddress,
            .streetAddressLine1,
            .streetAddressLine2,
            .addressCity,
            .addressState,
            .addressCityAndState,
            .sublocality,
            .countryName,
            .postalCode,
            .telephoneNumber,
            .emailAddress,
            .URL,
            .creditCardNumber
        ]
        if #available(iOS 11.0, *) {
            validValues += [
                .username,
                .password
            ]
        }
        if #available(iOS 12.0, *) {
            validValues += [
                .newPassword,
                .oneTimeCode
            ]
        }
        return validValues
    }

}

public extension UITextContentType {

    static var validRawValues: [String] {
        return UITextContentType.allCases.map({ $0.rawValue })
    }

    func isValid() -> Bool {
        return UITextContentType.validRawValues.contains(rawValue)
    }

}
