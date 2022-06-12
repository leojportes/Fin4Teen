//
//  Padding.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

public struct Padding {
    public let top: CGFloat
    public let left: CGFloat
    public let right: CGFloat
    public let bottom: CGFloat
    
    public init(top: CGFloat, left: CGFloat, right: CGFloat, bottom: CGFloat) {
        self.top = top
        self.bottom = bottom
        self.left = left
        self.right = right
    }
    
    public init(vertical: CGFloat, horizontal: CGFloat) {
        self.top = vertical
        self.bottom = vertical
        self.left = horizontal
        self.right = horizontal
    }
    
}

public extension Padding {
    
    static let zero: Padding = Padding(top: 0, left: 0, right: 0, bottom: 0)
    
    static func all(_ value: CGFloat) -> Padding {
        return Padding(top: value, left: value, right: value, bottom: value)
    }
    
    static func left(_ value: CGFloat) -> Padding {
        return Padding(top: 0, left: value, right: 0, bottom: 0)
    }
    
    static func right(_ value: CGFloat) -> Padding {
        return Padding(top: value, left: 0, right: 0, bottom: 0)
    }
    
    static func bottom(_ value: CGFloat) -> Padding {
        return Padding(top: 0, left: 0, right: value, bottom: 0)
    }
    
    static func vertical(_ value: CGFloat) -> Padding {
        return Padding(vertical: value, horizontal: 0)
    }
    
    static func vertical(top: CGFloat, bottom: CGFloat) -> Padding {
        return Padding(top: top, left: 0, right: bottom, bottom: 0)
    }
    
    static func horizontal(_ value: CGFloat) -> Padding {
        return Padding(vertical: 0, horizontal: value)
    }
    
    static func horizontal(left: CGFloat, right: CGFloat) -> Padding {
        return Padding(top: 0, left: left, right: right, bottom: 0)
    }
    
    func toEdgeInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: self.top, left: self.left, bottom: self.bottom, right: self.right)
    }
}

open class PaddingView: UIView {
    
    public let padding: Padding
    
    private(set) public lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.pin(toEdgesOf: self, padding: padding)
        
        return view
    }()
    
    //MARK: - Lifecycle
    
    public init(padding: Padding) {
        self.padding = padding
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public convenience init(padding: Padding, content: UIView) {
        self.init(padding: padding)
        self.contentView.addSubview(content)
        content.pin(toEdgesOf: self.contentView)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
