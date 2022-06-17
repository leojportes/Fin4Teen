//
//  RecommendationsDetailView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 16/06/22.
//

import UIKit

class RecommendationsDetailView: UIView, ViewCodeContract {
    
    // MARK: - Properties
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.setColor(color: .grayDarkHigh)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    private lazy var posterView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.setColor(color: .grayDarkHigh)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .black
        label.text = "titulo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var releaseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Setup viewcode
    func setupHierarchy() {
        self.addSubview(posterView)
        self.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        posterView
            .topAnchor(in: self, padding: 100)
            .heightAnchor(250)
            .widthAnchor(180)
            .centerX(in: self)

        titleLabel
            .topAnchor(in: posterView, attribute: .bottom, padding: 30)
            .leftAnchor(in: self)
            .rightAnchor(in: self)
            .heightAnchor(30)
    }
    
    // MARK: Bind model - view
    func bind(indexPath: IndexPath, value: [Movie]) {
        self.posterView.load(urlString: value[indexPath.row].url_poster)
        self.titleLabel.text = value[indexPath.row].title
    }

}
