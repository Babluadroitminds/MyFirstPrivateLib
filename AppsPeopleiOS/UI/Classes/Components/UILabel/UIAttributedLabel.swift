//
//  UIAttributedLabel.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 14/02/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

open class UIAttributedLabel: UILabel {

    override open var text: String? {
        get { return super.text }
        set { setText(newValue, keepAttributes: true) }
    }

}

public extension UILabel {

    func setText(_ text: String?, keepAttributes: Bool = false) {
        guard keepAttributes,
            let attributedString = attributedText?.mutableCopy() as? NSMutableAttributedString,
            attributedString.length > 0,
            let textToSet = text else {
                // Use attributedText to avoid infinite recursion
                self.attributedText = text != nil ? NSAttributedString(string: text!) : nil
                return
        }
        attributedString.mutableString.setString(textToSet)
        self.attributedText = attributedString
    }

}
