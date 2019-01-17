//
//  UIView+iMusic.swift
//  iMusic
//
//  Created by José María Ila on 17/1/19.
//  Copyright © 2019 José María Ila. All rights reserved.
//

import UIKit

// MARK: iOS 11 safe area

extension UIView {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        guard #available(iOS 11.0, *) else {
            return topAnchor
        }

        return safeAreaLayoutGuide.topAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        guard #available(iOS 11.0, *) else {
            return bottomAnchor
        }

        return safeAreaLayoutGuide.bottomAnchor
    }

    var safeTopInset: CGFloat {
        guard #available(iOS 11.0, *) else {
            return 0.0
        }

        return abs(safeAreaInsets.top)
    }

    var safeBottomInset: CGFloat {
        guard #available(iOS 11.0, *) else {
            return 0.0
        }

        return abs(safeAreaInsets.bottom)
    }
}
