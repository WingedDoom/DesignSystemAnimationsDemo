//
//  UIColor+DemoColors.swift
//  DSAnimationsDemo
//
//  Created by Булат Хабиров on 16.11.2021.
//

import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat) {
        let redHex = CGFloat((hex >> 16) & 0xFF)
        let greenHex = CGFloat((hex >> 8) & 0xFF)
        let blueHex = CGFloat(hex & 0xFF)
        self.init(red: redHex / 255.0, green: greenHex / 255.0, blue: blueHex / 255.0, alpha: alpha)
    }

    static func color(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { traitCollection in
                traitCollection.userInterfaceStyle == .dark ? dark : light
            }
        } else {
            return light
        }
    }
    
    static var textPrimaryInverted: UIColor {
        UIColor.color(light: UIColor(hex: 0xFFFFFF, alpha: 1.0), dark: UIColor(hex: 0x000000, alpha: 1.0))
    }
    
    static var backgroundPrimaryInverted: UIColor {
        UIColor.color(light: UIColor(hex: 0x121212, alpha: 1.0), dark: UIColor(hex: 0xFFFFFF, alpha: 1.0))
    }
    
    static var backgroundSecondaryInverted: UIColor {
        UIColor.color(light: UIColor(hex: 0x202022, alpha: 1.0), dark: UIColor(hex: 0xF3F4F5, alpha: 1.0))
    }
}
