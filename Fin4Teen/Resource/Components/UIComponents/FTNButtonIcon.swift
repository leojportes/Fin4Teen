//
//  FTNButtonIcon.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

final class FTNButtonIcon: UIButton {
    
    // MARK: - Private properties
    
    private var didTap: (() -> Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(image: UIImage? = nil,
         backgroundColor: UIColor = .clear,
         colorButton: UIColor? = nil,
         accessibility: String = "",
         action: Action?) {
        super.init(frame: .zero)
        self.accessibilityLabel = accessibility
        self.accessibilityTraits = .button
        self.layer.masksToBounds = true
        self.backgroundColor = backgroundColor
        
        let image = image
        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        
        self.tintColor = colorButton
        self.addTarget(nil, action: #selector(didTapButton), for: .touchUpInside)
        self.didTap = action
    }
    
    // MARK: - Actions
    
    @objc private func didTapButton() {
        self.didTap?()
    }
    
}
