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
        guard let urlApplication: URL = URL(string: url) else { return }
        UIApplication.shared.open(urlApplication as URL,
                                  options: [:],
                                  completionHandler: nil)
    }
    
}
