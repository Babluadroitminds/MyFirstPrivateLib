//
//  UIColor+helpers.swift
//  AppsPeopleiOS
//
//  Created by Olivier Voyer on 30/08/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit

/// This extension is providing some helpers functions to manipulate UIColor instances
extension UIColor {

    /// Create a ligher color
    ///
    /// - parameter percentage: The percentage we should apply to light the color.
    /// - returns: A new color or the current one in case of failure
    ///
    /// - important: the percentage must be positive
    public func lighter(by percentage: CGFloat = 0.1) -> UIColor {
        precondition(percentage > 0.0, "percentage must be greater than 0")
        return self.adjust(by: percentage)
    }

    /// Create a darker color
    ///
    /// - parameter percentage: The percentage we should apply to darken the color.
    /// - returns: A new color or the current one in case of failure
    ///
    /// - important: the percentage must be positive
    public func darker(by percentage: CGFloat = 0.1) -> UIColor {
        precondition(percentage > 0.0, "percentage must be greater than 0")
        return self.adjust(by: -1.0 * percentage)
    }

    /// Increase or decrease brightness
    ///
    /// - parameter percentage: The percentage we should apply to light/darken the color. A negative value will make a darker color and a positive value, a lighter one
    /// - returns: A new color or the current one in case of failure
    public func adjust(by percentage: CGFloat) -> UIColor {
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0, alpha: CGFloat = 0.0
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            print("Warning: UIColor \(self) is not in a compatible color space, adjustment is ignored")
            return self
        }
        return UIColor(red: min(red + percentage, 1.0),
                       green: min(green + percentage, 1.0),
                       blue: min(blue + percentage, 1.0),
                       alpha: alpha)
    }

}

extension UIColor {

    /// Create a gradient pattern color
    ///
    /// - parameter startColor: The start color of the gradient
    /// - parameter endColor: The end color of the gradient
    /// - parameter size: The dimensions before repetition happens in the pattern. Provide a 1-height size for horizontal gradients, or a 1-width size for vertical ones
    /// - returns: A pattern color with a gradient or nil in case of failure
    public class func gradient(from startColor: UIColor, to endColor: UIColor, size: CGSize) -> UIColor? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)

        // If the size is zero, the context will be nil.
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: [startColor.cgColor, endColor.cgColor] as CFArray, locations: nil) else {
            return nil
        }

        context.drawLinearGradient(gradient, start: CGPoint.zero, end: CGPoint(x: size.width, y: size.height), options: CGGradientDrawingOptions())
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        defer { UIGraphicsEndImageContext() }

        return UIColor(patternImage: image)
    }

}
