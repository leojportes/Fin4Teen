//
//  HomeNewsTableViewCell.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

final class HomeNewsTableViewCell: UITableViewCell, ViewCodeContract {
    
    // MARK: - Static properties
    static let identifier = "HomeNewsTableViewCell"
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    override func prepareForReuse() {
        imagePoster.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    private lazy var imagePoster: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenBoldFont.withSize(14)
        label.textColor = UIColor.setColor(.grayFullDark)
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconLink: FTNButtonIcon = {
        let button = FTNButtonIcon(image: UIImage(named: Image.ArrowDiagonal.rawValue),
                                    backgroundColor: UIColor.clear,
                                    colorButton: UIColor.setColor(.blackColor),
                                   accessibility: "Link externo", action: { })
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityTraits = .link
        return button
    }()
    
    // MARK: - Methods viewcode
    func setupHierarchy() {
        contentView.addSubview(imagePoster)
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconLink)
    }
    
    func setupConstraints() {
        imagePoster
            .topAnchor(in: contentView, padding: 10)
            .leftAnchor(in: contentView, padding: 20)
            .widthAnchor(60)
            .heightAnchor(60)
            .bottomAnchor(in: contentView, padding: 10)
        
        titleLabel
            .topAnchor(in: contentView, padding: 10)
            .leftAnchor(in: imagePoster, attribute: .right, padding: 10)
            .rightAnchor(in: iconLink, attribute: .left, padding: 5)
            .bottomAnchor(in: contentView, padding: 5)
        
        iconLink
            .centerY(in: contentView)
            .rightAnchor(in: contentView, padding: 10)
            .widthAnchor(15)
            .heightAnchor(15)
    }
    
    func setupConfiguration() {
        selectionStyle = .none
        imagePoster.clipsToBounds = true
        imagePoster.contentMode = .scaleAspectFill
        imagePoster.roundCorners(cornerRadius: 8)
    }
    
    // MARK: - Public methods
    public func setupCustomCell(image: String = String.empty,
                                title: String = String.empty) {
        setupPoster(image: image)
        titleLabel.text = title
    }
    
    // MARK: - Private methods
    private func setupPoster(image: String) {
        if image == String.empty {
            imagePoster.image = UIImage(named: Image.withoutImage.rawValue)
        } else {
            imagePoster.load(urlString: image)
        }
    }

}
