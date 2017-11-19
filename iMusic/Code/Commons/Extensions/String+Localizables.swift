//
//  String+Localizables.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

enum Strings: String {
    case title
    case search
    case error
    case accept
    
    var value: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
