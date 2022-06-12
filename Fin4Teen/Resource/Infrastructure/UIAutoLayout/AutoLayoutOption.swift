//
//  AutoLayoutOption.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

public enum AutoLayoutOption {
    case none
    case useSafeArea
    case useMargins
}

extension AutoLayoutOption {
    var useSafeArea: Bool {
        if case .useSafeArea = self {
            return true
        }
        
        return false
    }
    
    var useMargins: Bool {
        if case .useMargins = self {
            return true
        }
        
        return false
    }
}

public extension UIView {
    
    func pin(toEdgesOf view: UIView, padding: Padding = .zero, layoutOption: AutoLayoutOption = .none) {
        self
            .leftAnchor(in: view, attribute: .left, padding: padding.left, layoutOption: layoutOption)
            .rightAnchor(in: view, attribute: .right, padding: padding.right, layoutOption: layoutOption)
            .bottomAnchor(in: view, attribute: .bottom, padding: padding.bottom, layoutOption: layoutOption)
            .topAnchor(in: view, attribute: .top, padding: padding.top, layoutOption: layoutOption)
    }
    
    func removeSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
}
