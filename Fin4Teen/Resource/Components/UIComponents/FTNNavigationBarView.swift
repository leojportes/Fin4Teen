//
//  FTNNavigationBarView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

final class FTNNavigationBarView: UIView, ViewCodeContract {
    
    // MARK: - Private properties
    
    private var actionButton: Action?
    
    // MARK: - Init
    override func layoutSubviews() {
        setupView()
    }
    
    init(backgroundColor: UIColor,
         colorButton: UIColor? = nil,
         colorHorizontalLine: UIColor? = UIColor.setColor(.grayLight),
         iconRight: UIImage? = nil,
         backButtonAction: @escaping Action) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.backButton.tintColor = colorButton
        self.actionButton = backButtonAction
        self.horizontalLine.backgroundColor = colorHorizontalLine
        
        let image = iconRight
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(tintedImage, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(nil, action: #selector(didTapBack), for: .touchUpInside)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.setColor(.grayLight)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Methods viewcode
    
    func setupHierarchy() {
        self.addSubview(backButton)
        self.addSubview(titleLabel)
        self.addSubview(horizontalLine)
    }
    
    func setupConstraints() {
        backButton
            .leftAnchor(in: self, padding: 20)
            .centerY(in: self)
            .heightAnchor(20)
            .widthAnchor(20)
        
        titleLabel
            .leftAnchor(in: backButton, attribute: .right, padding: 20)
            .centerY(in: backButton)
        
        horizontalLine
            .bottomAnchor(in: self, attribute: .bottom)
            .leftAnchor(in: self)
            .rightAnchor(in: self)
            .heightAnchor(1)
    }
    
    func set(title: String,
             color: UIColor? = nil,
             font: UIFont? = nil) {
        self.titleLabel.text = title
        self.titleLabel.textColor = color
        self.titleLabel.text = title
        self.titleLabel.font = font
    }
    
    // MARK: - Actions methods
    
    @objc private func didTapBack() {
        self.actionButton?()
        print("tapped back button")
    }
    
}
