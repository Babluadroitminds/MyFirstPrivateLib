//
//  URL+urlComponents.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 30/08/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import Foundation

/// This extension is providing an helper function to look for parameters in a URL.
extension URL {

    /// Returns the string value associated with the specified parameter name.
    /// This method parses the URL contents and looks for the first matching query item with the given name.
    ///
    ///     let url = URL(string: "https://www.appspeople.com.au/index.php?id=0&browser=safari")!
    ///     if let browser = url.queryParameter(named: "browser") {
    ///         print("Browser is \(browser)") // Browser is safari
    ///     } else {
    ///         print("No browser parameter in query")
    ///     }
    ///
    /// - parameter name: The name of the query parameter.
    /// - parameter resolvingAgainstBaseURL: If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used.
    /// - returns: The string value for the specified parameter name, or nil if the method could not find the specified parameter.
    public func queryParameter(named name: String, resolvingAgainstBaseURL: Bool = true) -> String? {
        guard let urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = urlComponents.queryItems,
            let firstMatchingItem = queryItems.first(where: { $0.name == name }) else {
                return nil
        }
        return firstMatchingItem.value
    }

}
