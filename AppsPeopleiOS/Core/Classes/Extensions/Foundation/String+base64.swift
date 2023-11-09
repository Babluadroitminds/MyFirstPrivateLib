//
//  String+base64.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 29/08/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import Foundation

/// This extension is providing some helpers functions to deal with Base-64 encoding.
/// https://en.wikipedia.org/wiki/Base64
extension String {

    /// Initialize a `String` from a Base-64 encoded String using the given options.
    ///
    /// Returns nil when the input is not recognized as valid Base-64.
    ///
    ///     if let decoded = String(base64Encoded: "T2xpdmllcidzIEVhc3RlciBFZ2c=") {
    ///         print("Decoded string is \(decoded)") // Decoded string is AppsPeople
    ///     } else {
    ///         print("Invalid Base-64")
    ///     }
    ///
    /// - parameter base64String: The string to parse.
    /// - parameter options: Decoding options. Default value is `[]`.
    public init?(base64Encoded base64String: String, options: Data.Base64DecodingOptions = []) {
        guard let data = Data(base64Encoded: base64String, options: options) else { return nil }
        self.init(data: data, encoding: .utf8)
    }

    /// Returns the Base-64 encoded version of the string.
    ///
    ///     let encoded = "AppsPeople".toBase64()
    ///     print("Encoded string is \(encoded)") // Encoded string is QXBwc1Blb3BsZQ==
    ///
    /// - parameter options: The options to use for the encoding. Default value is `[]`.
    /// - returns: The Base-64 encoded string.
    public func toBase64(options: Data.Base64EncodingOptions = []) -> String {
        return Data(self.utf8).base64EncodedString(options: options)
    }

}
