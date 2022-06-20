//
//  FTNCellView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

public final class FTNCellView: UIView, ViewCodeContract {
    
    // MARK: - Private properties
    
    private var actionButton: Action?
    
    // MARK: - Init
    
    public override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    
    private lazy var horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.setColor(.grayLight)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenRegularFont.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var notifyView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.setColor(.grayLight)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var notifyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenRegularFont.withSize(8)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public func setupHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(horizontalLine)
        self.addSubview(iconView)
        self.addSubview(notifyView)
        self.addSubview(notifyLabel)
    }
    
    public func setupConstraints() {
        titleLabel
            .topAnchor(in: self, padding: 30)
            .leftAnchor(in: self)
        
        notifyView
            .centerY(in: titleLabel)
            .leftAnchor(in: titleLabel, attribute: .right, padding: 5)
            .heightAnchor(17)
            .widthAnchor(17)
        
        notifyLabel
            .centerY(in: notifyView)
            .centerX(in: notifyView)
        
        iconView
            .centerY(in: self)
            .heightAnchor(22)
            .widthAnchor(22)
            .rightAnchor(in: self)
        
        horizontalLine
            .bottomAnchor(in: self, attribute: .bottom)
            .leftAnchor(in: self)
            .rightAnchor(in: self)
            .heightAnchor(1)
 
    }
    
    public func setup(title: String,
                      font: UIFont? = UIFont.teenRegularFont.withSize(16),
                      colorFont: UIColor? = nil,
                      icon: UIImage? = nil,
                      colorHorizontalLine: UIColor? = UIColor.setColor(.grayLight),
                      action: Action?) {
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = font
        iconView.image = icon
        titleLabel.text = title
        titleLabel.textColor = colorFont
        actionButton = action
        horizontalLine.backgroundColor = colorHorizontalLine
    }
    
    public func setupConfiguration() {
        tapGestureRecognizer()
    }
    
    func notifyCount(notifyCount: String? = "", isHidden: Bool = false) {
        notifyLabel.text = notifyCount
        notifyView.isHidden = isHidden
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
