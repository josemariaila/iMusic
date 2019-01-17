//
//  UINavigationBar+iMusic.swift
//  iMusic
//
//  Created by José María Ila on 14/1/19.
//  Copyright © 2019 José María Ila. All rights reserved.
//

import UIKit

extension UINavigationBar {
    static func style() {
        let appearance = UINavigationBar.appearance()
        appearance.tintColor = UIColor.black
        appearance.barTintColor = UIColor.white
        appearance.isTranslucent = false
        appearance.isHidden = false
    }
}
