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
        contentView.backgroundColor = UIColor.setColor(color: .grayDarkest)
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Viewcode
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        contentView.addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView
            .pin(toEdgesOf: contentView)
        
    }
    
    public func setupCell(image: UIImage? = nil, topFive: UIImage? = nil) {
        imageView.image = image
    }
    
}
