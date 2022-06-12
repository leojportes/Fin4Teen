//
//  UIView+SafeAreaAnchors.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

public extension UIView {
    
    var viewLeftAnchorSafeArea: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leadingAnchor
        }
        
        return self.leftAnchor
    }
    
    var viewLeftAnchorMargin: NSLayoutXAxisAnchor {
        return self.layoutMarginsGuide.leftAnchor
    }
    
    var viewRightAnchorSafeArea: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.trailingAnchor
        }
        
        return self.rightAnchor
    }
    
    var viewRightAnchorMargin: NSLayoutXAxisAnchor {
        return self.layoutMarginsGuide.rightAnchor
    }
    
    var viewTopAnchorSafeArea: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        }
        
        return self.topAnchor
    }
    
    var viewTopAnchorMargin: NSLayoutYAxisAnchor {
        return self.layoutMarginsGuide.topAnchor
    }
    
    var viewBottomAnchorSafeArea: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        }
        
        return self.topAnchor
    }
    
    var viewBottomAnchorMargin: NSLayoutYAxisAnchor {
        return self.layoutMarginsGuide.bottomAnchor
    }
    
    var viewCenterXAnchorSafeArea: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerXAnchor
        }
        
        return self.centerXAnchor
    }
    
    var viewCenterXAnchorMargin: NSLayoutXAxisAnchor {
        return self.layoutMarginsGuide.centerXAnchor
    }
    
    var viewCenterYAnchorSafeArea: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerYAnchor
        }
        
        return self.centerYAnchor
    }
    
    var viewCenterYAnchorMargin: NSLayoutYAxisAnchor {
        return self.layoutMarginsGuide.centerYAnchor
    }
    
    var viewWidthAnchorSafeArea: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.widthAnchor
        }
        
        return self.widthAnchor
    }
    
    var viewWidthAnchorMargin: NSLayoutDimension {
        return self.layoutMarginsGuide.widthAnchor
    }
    
    var viewHeightAnchorSafeArea: NSLayoutDimension {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.heightAnchor
        }
        
        return self.heightAnchor
    }
    
    var viewHeightAnchorMargin: NSLayoutDimension {
        return self.layoutMarginsGuide.heightAnchor
    }
    
    var widthSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.layoutFrame.width
        }
        
        return frame.width
    }
    
    var widthMargin: CGFloat {
        return layoutMarginsGuide.layoutFrame.width
    }
    
    var heightSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.layoutFrame.height
        }
        
        return frame.height
    }
    
    var heightMargin: CGFloat {
        return layoutMarginsGuide.layoutFrame.height
    }
    
}
