//
//  UIColor+iMusic.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

// MARK: - Utilities

extension UIColor {
    static func colorRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
}

// MARK: - Colors

extension UIColor {
    static let gray = UIColor.colorRGB(red: 108.0, green: 108.0, blue: 108.0)
    static let grayDark = UIColor.colorRGB(red: 51.0, green: 51.0, blue: 51.0)
}
