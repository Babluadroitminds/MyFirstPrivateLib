//
//  UIView+loadNib.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 06/06/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

public extension UIView {

    /// Usage:
    ///
    /// `let myView: MyCustomView = MyCustomView.loadNib()`

    class func loadNib<T: UIView>() -> T {
        guard let view = Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: self, options: [:])?.first as? T else {
            fatalError("Could not init NIB named: \(String(describing: T.self))")
        }
        return view
    }

}
