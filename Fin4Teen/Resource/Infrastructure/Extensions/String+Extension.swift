//
//  String+Extension.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import Foundation

public extension String {
    
    /// An empty swift string
    static var empty: String {
        return ""
    }

    func localize(bundle: Bundle) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: String.empty, comment: String.empty)
    }

}
