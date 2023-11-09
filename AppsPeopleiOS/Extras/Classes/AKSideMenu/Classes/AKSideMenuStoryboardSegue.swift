//
//  AKSideMenuStoryboardSegue.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 12/02/2019.
//  Copyright © 2019 Apps People. All rights reserved.
//

import AKSideMenu

/// Storyboard segue to use in conjunction with AKSideMenu to switch with a new content viewcontroller directly from a storyboard segue
///
/// https://github.com/dogo/AKSideMenu
open class AKSideMenuSetViewControllerSegue: UIStoryboardSegue {

    /// Value set from the "Animates" checkbox in storyboard
    private var shouldAnimate: Bool { return UIView.areAnimationsEnabled }

    override open func perform() {
        guard let sideMenuViewController = source.sideMenuViewController else {
            assert(false, "A \(String(describing: type(of: self))) segue source view controller must have a side menu")
            return
        }
        sideMenuViewController.setContentViewController(destination, animated: shouldAnimate)
        sideMenuViewController.hideMenuViewController()
    }

}
