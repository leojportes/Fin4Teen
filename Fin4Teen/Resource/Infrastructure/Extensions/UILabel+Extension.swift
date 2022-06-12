//
//  UILabel+Extension.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

extension UILabel {
    public func setDifferentColor(string: String, location: Int = 0, length: Int, color: UIColor){
        let attText = NSMutableAttributedString(string: string)
        attText.addAttribute(NSAttributedString.Key.foregroundColor, value: color,
                             range: NSRange(location: location, length: length))
        attributedText = attText
        
    }
    
    /// - Method that adjusts the length of a line.
    func setLineHeight(lineHeight: CGFloat) {
        let text = self.text
        if let text = text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineSpacing = lineHeight
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, text.count))
            self.attributedText = attributeString
        }
    }
}
