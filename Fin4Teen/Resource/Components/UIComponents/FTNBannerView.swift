//
//  FTNBannerView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 22/06/22.
//

import UIKit

public final class FTNBannerView: UIView, ViewCodeContract {
  
    
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
    
    public func setupHierarchy() {
        self.addSubview(icon)
        icon
            .pin(toEdgesOf: self)
    }
    
    public func setupConstraints() {
        tapGestureRecognizer()
    }
    
    public func setup(image: UIImage? = nil,
                      action: @escaping Action) {
        icon.image = image
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
