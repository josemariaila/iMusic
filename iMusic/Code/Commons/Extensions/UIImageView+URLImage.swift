//
//  UIImageView+URLImage.swift
//  iMusic
//
//  Created by José María Ila on 19/11/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit
import Foundation

extension UIImageView {
    
    func setImage(fromUrlString urlString: String) {
        
        guard let url = URL(string: urlString) else {
            image = nil
            return
        }
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async { [weak self] in
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            } catch {
                self?.image = nil
            }
        }
    }
}
