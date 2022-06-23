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
        view.backgroundColor = .black
        view.roundCorners(cornerRadius: 10)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        self.addSubview(baseView)
        baseView.addSubview(imageView)
    }
    
    func setupConstraints() {
        baseView
            .topAnchor(in: self)
            .leftAnchor(in: self, padding: 5)
            .rightAnchor(in: self, padding: 5)
            .bottomAnchor(in: self)
        
        imageView
            .pin(toEdgesOf: baseView)
        
    }
    
    public func setupCell(image: UIImage? = nil) {
        imageView.image = image
    }
    
}
