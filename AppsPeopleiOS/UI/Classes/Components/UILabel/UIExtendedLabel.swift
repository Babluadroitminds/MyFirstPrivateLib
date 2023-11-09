//
//  UIExtendedLabel.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 17/04/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

@IBDesignable open class UIExtendedLabel: UILabel {

    @IBInspectable open var characterSpacing: CGFloat {
        get {
            guard let attributedString = attributedText, let kern = attributedString.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: nil) as? CGFloat else {
                return 0.0
            }
            return kern
        }
        set {
            let mutableAttributedString: NSMutableAttributedString
            if let attributedText = attributedText {
                mutableAttributedString = NSMutableAttributedString(attributedString: attributedText)
            } else if let text = text {
                mutableAttributedString = NSMutableAttributedString(string: text)
            } else {
                return
            }
            mutableAttributedString.addAttribute(NSAttributedString.Key.kern, value: newValue, range: NSRange(location: 0, length: mutableAttributedString.length))
            self.attributedText = mutableAttributedString
            setNeedsLayout()
        }
    }

}
