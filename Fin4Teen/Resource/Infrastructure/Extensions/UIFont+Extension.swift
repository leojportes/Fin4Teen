//
//  UIFont+Extension.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//


import UIKit

public extension UIFont {
    
    static let fontDefaultGeorgia = UIFont(name: "Georgia", size: 5) ?? UIFont()
  
    static var teenLightFont: UIFont {
        return UIFont(name: "Spartan-Light", size: 16) ?? fontDefaultGeorgia
    }
    
    static var teenMediumFont: UIFont {
        return UIFont(name: "Spartan-Medium", size: 16) ?? fontDefaultGeorgia
    }
    
    static var teenThinFont: UIFont {
        return UIFont(name: "Spartan-Thin", size: 16) ?? fontDefaultGeorgia
    }
    
    static var teenBoldFont: UIFont {
        return UIFont(name: "Spartan-Bold", size: 16) ?? fontDefaultGeorgia
    }
    
    static var teenRegularFont: UIFont {
        return UIFont(name: "Spartan-Regular", size: 16) ?? fontDefaultGeorgia
    }
    
    static var teenExtraLightFont: UIFont {
        return UIFont(name: "Spartan-ExtraLight", size: 16) ?? fontDefaultGeorgia
    }
    
    // MARK: - Buttons
    
    static var teenSemiBoldFontButton: UIFont {
        return UIFont(name: "Spartan-SemiBold", size: 16) ?? fontDefaultGeorgia
    }
}
