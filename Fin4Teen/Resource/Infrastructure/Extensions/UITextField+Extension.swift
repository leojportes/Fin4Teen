//
//  UITextField+Extension.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

extension UITextField {
    
    /// - Method that shades a textfield.
    func addShadow(color: CGColor = UIColor.setColor(color: .blackColor).cgColor,
                   radius: CGFloat = 6.0,
                   opacity: Float = 0.1,
                   offset: CGSize = CGSize(width: -4, height: 0)) {
        self.layer.shadowColor = color
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }
    
}
