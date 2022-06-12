//
//  AppControlVersion.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import Foundation

final public class AppControlVersion {
    
    init() { /* empty method */ }
    
    func checkVersionLimit() -> String {
        
        let kVersion = "CFBundleShortVersionString"
        
        guard let currentVersion = Bundle.main.infoDictionary?[kVersion] as? String else { fatalError("Failed to found current version.") }
        
        return currentVersion
    }
    
}
