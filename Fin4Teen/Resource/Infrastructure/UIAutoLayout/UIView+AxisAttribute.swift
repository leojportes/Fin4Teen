//
//  UIView+AxisAttribute.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

public enum XAxisAttribute {
    case left
    case right
}

public enum YAxisAttribute {
    case top
    case bottom
}

public extension UIView {
    
    @discardableResult
    func leftAnchor(
        in superview: UIView,
        attribute: XAxisAttribute = .left,
        padding: CGFloat = 0,
        layoutOption: AutoLayoutOption = .useSafeArea) -> Self {
        
        let useSafeArea = layoutOption.useSafeArea
        let useMargins = layoutOption.useMargins
        
        let leftAnchor = thisLeftAnchor(useSafeArea: useSafeArea, useMargins: useMargins)
        
        let superviewAxisXAnchor: NSLayoutXAxisAnchor
        
        if attribute == .left {
            superviewAxisXAnchor = superview.thisLeftAnchor(useSafeArea: useSafeArea, useMargins: useMargins)
        } else {
            superviewAxisXAnchor = superview.thisRightAnchor(useSafeArea: useSafeArea, useMargins: useMargins)
        }
        
        leftAnchor.constraint(equalTo: superviewAxisXAnchor,
                              constant: padding).isActive = true
        return self
    }
    
    @discardableResult
    func rightAnchor(
        in superview: UIView,
        attribute: XAxisAttribute = .right,
        padding: CGFloat = 0,
        layoutOption: AutoLayoutOption = .useSafeArea) -> Self {
        
        let useSafeArea = layoutOption.useSafeArea
        let useMargins = layoutOption.useMargins
        
        let rightAnchor = thisRightAnchor(useSafeArea: useSafeArea, useMargins: useMargins)
        
        let superviewAxisXAnchor: NSLayoutXAxisAnchor
        
        if attribute == .right {
            superviewAxisXAnchor = superview.thisRightAnchor(useSafeArea: useSafeArea, useMargins: useMargins)
        } else {
            superviewAxisXAnchor = superview.thisLeftAnchor(useSafeArea: useSafeArea, useMargins: useMargins)
        }
        
        rightAnchor.constraint(equalTo: superviewAxisXAnchor,
                              constant: -padding).isActive = true
        return self
    }
    
    @discardableResult
    func topAnchor(
        in superview: UIView,
        attribute: YAxisAttribute = .top,
        padding: CGFloat = 0,
        layoutOption: AutoLayoutOption = .useSafeArea) -> Self {
        
        let useSafeArea = layoutOption.useSafeArea
        let useMargins = layoutOption.useMargins
        
        let topAnchor = thisTopAnchor(useSafeArea: useSafeArea,
                                      useMargins: useMargins)
        
        let superviewAxisYAnchor: NSLayoutYAxisAnchor
        
        if attribute == .top {
            superviewAxisYAnchor = superview.thisTopAnchor(useSafeArea: useSafeArea, useMargins: useMargins)
        } else {
            superviewAxisYAnchor = superview.thisBottomAnchor(useSafeArea: useSafeArea, useMargins: useMargins)
        }
        
        topAnchor.constraint(equalTo: superviewAxisYAnchor,
                             constant: padding).isActive = true
        
        return self
    }
    
    
    
    @discardableResult
    func bottomAnchor(
        in superview: UIView,
        attribute: YAxisAttribute = .bottom,
        padding: CGFloat = 0,
        layoutOption: AutoLayoutOption = .useSafeArea) -> Self {
        
        let useSafeArea = layoutOption.useSafeArea
        let useMargins = layoutOption.useMargins
        
        let bottomAnchor = thisBottomAnchor(useSafeArea: useSafeArea,
                                      useMargins: useMargins)
        
        let superviewAxisYAnchor: NSLayoutYAxisAnchor
        
        if attribute == .bottom {
            superviewAxisYAnchor = superview.thisBottomAnchor(useSafeArea: useSafeArea, useMargins: useMargins)
        } else {
            superviewAxisYAnchor = superview.thisTopAnchor(useSafeArea: useSafeArea, useMargins: useMargins)
        }
        
        bottomAnchor.constraint(equalTo: superviewAxisYAnchor,
                             constant: -padding).isActive = true
        
        return self
    }
    
    @discardableResult
    func centerY(in superview: UIView, layoutOption: AutoLayoutOption = .useSafeArea) -> Self {
        
        let useSafeArea = layoutOption.useSafeArea
        let useMargins = layoutOption.useMargins
        
        let centerYAnchor = thisCenterYAnchor(useSafeArea: useSafeArea,
                                      useMargins: useMargins)
        let superviewAnchor = superview.thisCenterYAnchor(useSafeArea: useSafeArea,
                                                          useMargins: useMargins)
        centerYAnchor.constraint(equalTo: superviewAnchor).isActive = true
        
        return self
    }
    
    @discardableResult
    func centerX(in superview: UIView, layoutOption: AutoLayoutOption = .useSafeArea) -> Self {
        
        let useSafeArea = layoutOption.useSafeArea
        let useMargins = layoutOption.useMargins
        
        let centerxAnchor = thisCenterXAnchor(useSafeArea: useSafeArea,
                                      useMargins: useMargins)
        let superviewAnchor = superview.thisCenterXAnchor(useSafeArea: useSafeArea,
                                                          useMargins: useMargins)
        centerxAnchor.constraint(equalTo: superviewAnchor).isActive = true
        
        return self
    }
    
    @discardableResult
    func center(in superview: UIView, layoutOption: AutoLayoutOption = .useSafeArea) -> Self {
        
        centerY(in: superview, layoutOption: layoutOption)
        centerX(in: superview, layoutOption: layoutOption)
        
        return self
    }
    
    @discardableResult
    func widthAnchor(
        in superview: UIView,
        _ multiplier: CGFloat,
        layoutOption: AutoLayoutOption = .useSafeArea,
        withLayoutPriorityValue priority: Float = UILayoutPriority.required.rawValue) -> Self {
        
        let useSafeArea = layoutOption.useSafeArea
        let useMargins = layoutOption.useMargins
        
        let widthAnchor = thisWidthAnchor(useSafeArea: useSafeArea,
                                      useMargins: useMargins)
        let superviewWidthAnchor = superview.thisWidthAnchor(useSafeArea: useSafeArea,
                                                          useMargins: useMargins)
        widthAnchor.constraint(equalTo: superviewWidthAnchor, multiplier: multiplier, withLayoutPriorityValue: priority).isActive = true
        
        return self
    }
    
    @discardableResult
    func widthAnchor(
        _ value: CGFloat,
        layoutOption: AutoLayoutOption = .useSafeArea,
        withLayoutPriorityValue priority: Float = UILayoutPriority.required.rawValue) -> Self {

        let widthAnchor = thisWidthAnchor(useSafeArea: layoutOption.useSafeArea,
                                          useMargins: layoutOption.useMargins)

        widthAnchor.constraint(equalToConstant: value, withLayoutPriorityValue: priority).isActive = true
        
        return self
    }
    
    @discardableResult
    func heightAnchor(
        in superview: UIView,
        _ multiplier: CGFloat,
        layoutOption: AutoLayoutOption = .useSafeArea,
        withLayoutPriorityValue priority: Float = UILayoutPriority.required.rawValue) -> Self {
        
        let useSafeArea = layoutOption.useSafeArea
        let useMargins = layoutOption.useMargins
        
        let heightAnchor = thisHeightAnchor(useSafeArea: useSafeArea,
                                      useMargins: useMargins)
        let superviewHeightAnchor = superview.thisHeightAnchor(useSafeArea: useSafeArea,
                                                          useMargins: useMargins)
        heightAnchor.constraint(equalTo: superviewHeightAnchor, multiplier: multiplier, withLayoutPriorityValue: priority).isActive = true
        
        return self
    }
    
    @discardableResult
    func heightAnchor(
        _ value: CGFloat,
        layoutOption: AutoLayoutOption = .useSafeArea,
        withLayoutPriorityValue priority: Float = UILayoutPriority.required.rawValue) -> Self {
        
        let heightAnchor = thisHeightAnchor(useSafeArea: layoutOption.useSafeArea,
                                          useMargins: layoutOption.useMargins)
        
        heightAnchor.constraint(equalToConstant: value, withLayoutPriorityValue: priority).isActive = true
        
        return self
    }
    
}
