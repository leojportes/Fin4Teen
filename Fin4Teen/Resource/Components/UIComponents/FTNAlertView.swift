//
//  FTNAlertView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

extension UIAlertController {
    static func show(title: String, messsage: String) -> UIAlertController {
     
        let alert = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
        
        return alert
    }
}
