//
//  URLManager.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 03/10/2017.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit
import SafariServices
import PPTopMostController

public class URLManager {

    static public let sharedInstance: URLManager = URLManager()

    fileprivate let application: UIApplication = UIApplication.shared

    fileprivate init() { }

    @discardableResult public func openURLInBrowser(_ url: URL) -> Bool {
        var urlToOpen = url
        if urlToOpen.scheme == nil {
            urlToOpen = URL(string: "http://" + url.absoluteString)!
        }

        guard let parent = UIViewController.topMost(), (urlToOpen.scheme == "http" || urlToOpen.scheme == "https") else {
            return openURL(url)
        }

        guard application.canOpenURL(urlToOpen) else {
            return false
        }

        let safariViewController: SFSafariViewController
        if #available(iOS 11.0, *) {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = true
            safariViewController = SFSafariViewController(url: urlToOpen, configuration: configuration)
        } else {
            // Fallback on earlier versions
            safariViewController = SFSafariViewController(url: urlToOpen)
        }
        parent.present(safariViewController, animated: true)
        return true
    }

    @discardableResult public func openURLInBrowser(_ string: String) -> Bool {
        guard let url = URL(string: string) else {
            return false
        }
        return openURLInBrowser(url)
    }

    @discardableResult public func openURL(_ url: URL) -> Bool {
        var urlToOpen = url
        if urlToOpen.scheme == nil {
            urlToOpen = URL(string: "http://" + url.absoluteString)!
        }

        guard application.canOpenURL(urlToOpen) else {
            return false
        }

        application.open(urlToOpen)
        return true
    }

    @discardableResult public func openURL(_ string: String) -> Bool {
        guard let url = URL(string: string) else {
            return false
        }
        return openURL(url)
    }

}
