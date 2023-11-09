//
//  UITextField+nextField.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 03/10/2017.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

private var kAssociationKeyNextField: String = "_nextField"

public extension UITextField {

    @IBOutlet var nextField: UITextField? {
        get { return objc_getAssociatedObject(self, &kAssociationKeyNextField) as? UITextField }
        set { objc_setAssociatedObject(self, &kAssociationKeyNextField, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }

}

extension UIViewController /*: UITextFieldDelegate*/ {

    @objc open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let nextField = textField.nextField else {
            textField.resignFirstResponder()
            return true
        }
        nextField.becomeFirstResponder()
        return true
    }

}
