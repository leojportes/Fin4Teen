//
//  ApplicationWeb.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

public final class ApplicationWeb {
    
    static let shared: ApplicationWeb = ApplicationWeb()
    
    init() { /*empty method */ }
    
    public func open(url: String) {
        let urlApplication = url
        UIApplication.shared.open(URL(string: urlApplication)! as URL,
                                  options: [:],
                                  completionHandler: nil)
    }
    
}
