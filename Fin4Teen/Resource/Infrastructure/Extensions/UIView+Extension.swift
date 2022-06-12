//
//  UIView+Extension.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

extension UIView {
    
    /// RoudCorners method, to rouded UIView borders.
    func roundCorners(cornerRadius: CGFloat, typeCorners: CACornerMask? = nil) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners ?? [.topLeft,
                                                   .topRight,
                                                   .bottomLeft,
                                                   .bottomRight]
    }
}

extension CACornerMask {
    static public let bottomRight: CACornerMask = .layerMaxXMaxYCorner
    static public let bottomLeft: CACornerMask = .layerMinXMaxYCorner
    static public let topRight: CACornerMask = .layerMaxXMinYCorner
    static public let topLeft: CACornerMask = .layerMinXMinYCorner
}
