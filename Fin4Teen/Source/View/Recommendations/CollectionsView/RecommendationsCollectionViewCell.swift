//
//  RecommendationsCollectionViewCell.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

final class RecommendationsCollectionViewCell: UICollectionViewCell, ViewCodeContract {
    
    // MARK: - Properties
    
    static let identifier = "RecommendationsCollectionViewCell"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.backgroundColor = .red
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = UIColor.setColor(color: .whiteStandart)
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Viewcode
    
    private lazy var topFiveImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(topFiveImage)
    }
    
    func setupConstraints() {
        imageView
            .pin(toEdgesOf: contentView)
        
        topFiveImage
            .leftAnchor(in: imageView, padding: -20)
            .bottomAnchor(in: imageView, padding: -17)
            .widthAnchor(110)
            .heightAnchor(130)
    }
    
    public func setupCell(image: String, topFive: UIImage? = nil) {
        imageView.load(urlString: image)
        topFiveImage.image = topFive
    }
    
}
