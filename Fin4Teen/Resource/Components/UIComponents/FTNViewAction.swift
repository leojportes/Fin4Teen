//
//  FTNViewAction.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

public final class FTNViewAction: UIView, ViewCodeContract {
  
    
    // MARK: - Properties
    
    private var actionButton: Action?
    
    // MARK: - Lifecycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    
    private lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenSemiBoldFontButton.withSize(15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func setupHierarchy() {
        self.addSubview(icon)
        self.addSubview(titleLabel)
        
        icon
            .topAnchor(in: self)
            .leftAnchor(in: self)
            .heightAnchor(18)
            .widthAnchor(16)
        
        titleLabel
            .topAnchor(in: self, padding: 3)
            .leftAnchor(in: icon, attribute: .right, padding: 5)
    }
    
    public func setupConstraints() {
        tapGestureRecognizer()
    }
    
    public func setup(title: String,
                      image: UIImage? = nil,
                      backgroundColor: UIColor,
                      action: @escaping Action) {
        icon.image = image
        titleLabel.text = title
        self.backgroundColor = backgroundColor
        actionButton = action
    }
    
    // MARK: - Actions
    
    @objc private func tappedView(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            self.actionButton?()
        }
    }
    
    private func tapGestureRecognizer() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.tappedView))
        self.addGestureRecognizer(tapGR)
        self.isUserInteractionEnabled = true
    }

}
