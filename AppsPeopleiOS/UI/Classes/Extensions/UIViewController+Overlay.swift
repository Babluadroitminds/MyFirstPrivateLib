//
//  UIViewController+Overlay.swift
//  AppsPeopleiOS
//
//  Created by Alexander Karan on 8/11/18.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

public extension UIViewController {

    private struct AssociatedKeys {
        static var overlayWindow: UInt8 = 0
    }

    internal var overlayWindow: UIWindow? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.overlayWindow) as? UIWindow
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.overlayWindow, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /// Present the UIViewController over the top of every visible view
    ///
    /// - parameter flag: Pass true to animate the presentation; otherwise, pass false.
    /// - parameter ignoreIfOverlayInUse: Pass true not to present this UIViewController if there is already a UIViewController presented in an overlay.
    /// - parameter prefersStatusBarHidden: Pass true to hide the Status Bar when the UIViewController is present. Defaults to the StatusBar of the currently visible view if not given a value.
    /// - parameter statusBarStyle: Set the style of the Status Bar when the UIViewControllers is present. Defaults to the StatusBar of the currently visible view if not given a value.
    /// - parameter completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func presentInOverlay(animated flag: Bool, ignoreIfOverlayInUse: Bool = true, prefersStatusBarHidden: Bool = UIApplication.shared.isStatusBarHidden, statusBarStyle: UIStatusBarStyle = UIApplication.shared.statusBarStyle, completion: (() -> Void)?) {
        let newWindow = UIWindow.newWindow(prefersStatusBarHidden: prefersStatusBarHidden, statusBarStyle: statusBarStyle)
        if ignoreIfOverlayInUse && UIWindow.isNewWindowPresented() { return }
        self.overlayWindow = newWindow
        // rootViewController can never be nil as its created by the custom new window method and custom root view
        newWindow.rootViewController!.present(self, animated: flag, completion: completion)
    }
}
