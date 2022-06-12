//
//  FNTButton.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

final class FNTButton: UIButton {
    
    // MARK: - Private properties
    
    private var didTap: (() -> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String,
         font: UIFont? = UIFont.teenRegularFont.withSize(16),
         backgroundColor: UIColor,
         textColor: UIColor,
         accessibilityTitle: String,
         action: Action?) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.accessibilityLabel = accessibilityTitle
        self.accessibilityTraits = .button
        self.titleLabel?.font = font
        self.setTitleColor(textColor, for: .normal)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.backgroundColor = backgroundColor
        self.addTarget(nil, action: #selector(didTapButton), for: .touchUpInside)
        self.didTap = action
    }
    
    // MARK: - Actions
    
    @objc private func didTapButton() {
        self.didTap?()
    }
    
}
