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
    private var switchColor: Bool = false
    private var selectedColor: UIColor = .white
    private var initialColor: UIColor = .white
    
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
         switchColor: Bool = false,
         selectedColor: UIColor? = nil,
         action: Action?) {
        super.init(frame: .zero)
        self.accessibilityLabel = accessibility
        self.accessibilityTraits = .button
        self.layer.masksToBounds = true
        self.backgroundColor = backgroundColor
        self.switchColor = switchColor
        self.selectedColor = selectedColor ?? .white
        self.initialColor = colorButton ?? .white
        
        if colorButton != nil {
            let image = image
            let tintedImage = image?.withRenderingMode(.alwaysTemplate)
            self.setImage(tintedImage, for: .normal)
            self.tintColor = colorButton
        } else {
            self.setImage(image, for: .normal)
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(nil, action: #selector(didTapButton), for: .touchUpInside)
        self.didTap = action
    }
    
    // MARK: - Actions
    
    @objc private func didTapButton(_ sender: UIButton) {
        if switchColor {
            sender.isSelected = sender.isSelected.not
            if sender.isSelected {
                self.tintColor = selectedColor
            } else {
                self.tintColor = initialColor
            }
        }
        self.didTap?()
    }
    
}
