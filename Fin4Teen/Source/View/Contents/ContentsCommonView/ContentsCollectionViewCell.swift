//
//  ContentsCollectionViewCell.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

final class ContentsCollectionViewCell: UICollectionViewCell, ViewCodeContract {
    
    // MARK: - Properties
    
    static let identifier = "ContentsCollectionViewCell"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = UIColor.setColor(.whiteStandart)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Viewcode
    
    private lazy var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .setColor(.grayLight)
        view.roundCorners(cornerRadius: 10)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .darkGray
        image.roundCorners(cornerRadius: 10)
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.teenBoldFont.withSize(15)
        label.text = "Como começar a investir do zero."
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.font = UIFont.teenRegularFont.withSize(12)
        label.textColor = .setColor(.grayFullDark)
        label.text = "Aprenda do básico ao avançado para iniciar seus investimentos."
        return label
    }()

    private lazy var durationBadge: FNTDurationBadge = {
        let view = FNTDurationBadge(duration: "14:05")
        return view
    }()
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        self.addSubview(baseView)
        baseView.addSubview(imageView)
        imageView.addSubview(durationBadge)
        
        baseView.addSubview(titleLabel)
        baseView.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        baseView
            .topAnchor(in: self)
            .leftAnchor(in: self, padding: 5)
            .rightAnchor(in: self, padding: 5)
            .bottomAnchor(in: self)
        
        imageView
            .topAnchor(in: baseView)
            .leftAnchor(in: baseView)
            .widthAnchor(160)
            .bottomAnchor(in: baseView)
        
        durationBadge
            .bottomAnchor(in: imageView, padding: 5)
            .rightAnchor(in: imageView, padding: 10)
        
        titleLabel
            .topAnchor(in: baseView, padding: 5)
            .leftAnchor(in: imageView, attribute: .right, padding: 5)
            .rightAnchor(in: baseView, padding: 5)
        
        descriptionLabel
            .topAnchor(in: titleLabel, attribute: .bottom, padding: 5)
            .leftAnchor(in: imageView, attribute: .right, padding: 5)
            .rightAnchor(in: baseView, padding: 10)
            
    }
    
    public func setupCell(image: UIImage? = nil) {
        imageView.image = image
    }
    
}
