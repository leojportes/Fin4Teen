//
//  FTNTextField.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//


import UIKit

final class FTNTextField: UITextField {
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.setColor(.whiteStandart)
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.setColor(.grayLight).cgColor
        self.addShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    var textPadding = UIEdgeInsets(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20
    )
    
    // MARK: - Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
