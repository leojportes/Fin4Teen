//
//  FNTDurationBadge.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 04/11/22.
//

import UIKit

public class FNTDurationBadge: UIView, ViewCodeContract {
    private var duration: String
    
    init(duration: String) {
        self.duration = duration
        super.init(frame: .zero)
        layer.opacity = 0.8
        alpha = 0.7
        backgroundColor = .black
        heightAnchor(15)
        widthAnchor(40)
        translatesAutoresizingMaskIntoConstraints = false
        roundCorners(cornerRadius: 3)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.teenMediumFont.withSize(10)
        label.textColor = .white
        label.tintColor = .white
        label.text = duration
        label.alpha = 1
        return label
    }()

    public func setupHierarchy() {
        addSubview(titleLabel)
    }
    
    public func setupConstraints() {
        titleLabel
            .center(in: self)
    }
}
