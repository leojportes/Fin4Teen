//
//  UIColor+Extension.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit
import Foundation

public extension UIColor {
    
    static func setColor(color: TeenColors) -> UIColor {
        return UIColor(named: color.rawValue) ?? UIColor.white
    }

}
