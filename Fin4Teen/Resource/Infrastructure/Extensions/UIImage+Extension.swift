//
//  UIImage+Extension.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 19/06/22.
//

import UIKit

extension UIImage {
    static func icon(_ icon: Image) -> UIImage {
        return UIImage(named: icon.rawValue) ?? .remove
    }
}
