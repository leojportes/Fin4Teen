//
//  NSAtributtedString+Extension.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

extension NSMutableAttributedString {
    
    func stringMutable(subString: String, fromString: String) -> NSMutableAttributedString {

         
         let attributedText = NSMutableAttributedString(string: fromString)
         
        attributedText.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 15)!], range: getRangeOfSubString(subString: subString, fromString: fromString))
        
        return attributedText
    }
    
    func getRangeOfSubString(subString: String, fromString: String) -> NSRange {
        let sampleLinkRange = fromString.range(of: subString)!
        let startPos = fromString.distance(from: fromString.startIndex, to: sampleLinkRange.lowerBound)
        let endPos = fromString.distance(from: fromString.startIndex, to: sampleLinkRange.upperBound)
        let linkRange = NSMakeRange(startPos, endPos - startPos)
        return linkRange
    }

}
