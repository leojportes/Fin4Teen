//
//  RecommendationsDetailView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 16/06/22.
//

import UIKit

class RecommendationsDetailView: UIView, ViewCodeContract {
    
    // MARK: - Properties
    let alphaValue: CGFloat = 0.95
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.setColor(color: .grayDarkHigh)
        self.alpha = alphaValue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.setColor(color: .grayDarkHigh)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var posterView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.setColor(color: .grayDarkHigh)
        image.roundCorners(cornerRadius: 7)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var gripView: UIView = {
        let grip = UIView()
        grip.backgroundColor = .lightGray
        grip.roundCorners(cornerRadius: 2)
        grip.translatesAutoresizingMaskIntoConstraints = false
        return grip
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.teenBoldFont.withSize(17)
        label.numberOfLines = .zero
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
        label.font = UIFont.teenMediumFont.withSize(15)
        label.textColor = UIColor.setColor(color: .grayLight)
        label.backgroundColor = .clear
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Setup viewcode
    func setupHierarchy() {
        self.addSubview(gripView)
        self.addSubview(baseView)
        baseView.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        containerView.addSubview(posterView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        
        containerView.addSubview(releaseLabel)
    }
    
    func setupConstraints() {
        
        gripView
            .topAnchor(in: self, padding: 10)
            .centerX(in: self)
            .heightAnchor(5)
            .widthAnchor(35)
        
        baseView
            .topAnchor(in: self, padding: 30)
            .leftAnchor(in: self)
            .rightAnchor(in: self)
            .bottomAnchor(in: self, layoutOption: .useMargins)
        
        scrollView
            .topAnchor(in: baseView)
            .leftAnchor(in: baseView)
            .rightAnchor(in: baseView)
            .bottomAnchor(in: baseView, layoutOption: .useSafeArea)
        
        containerView
            .pin(toEdgesOf: scrollView)
        containerView
            .widthAnchor(in: scrollView, 1)
            .heightAnchor(in: scrollView, 1, withLayoutPriorityValue: 250)
        
        posterView
            .topAnchor(in: containerView, padding: 20)
            .heightAnchor(280)
            .widthAnchor(190)
            .leftAnchor(in: containerView, padding: 15)
        
        releaseLabel
            .topAnchor(in: containerView, padding: 20)

        titleLabel
            .topAnchor(in: containerView, padding: 25)
            .leftAnchor(in: posterView, attribute: .right, padding: 15)
            .rightAnchor(in: containerView, padding: 15)
        
        descriptionLabel
            .topAnchor(in: posterView, attribute: .bottom, padding: 25)
            .leftAnchor(in: containerView, padding: 15)
            .rightAnchor(in: containerView, padding: 15)
    }
    
    // MARK: Bind model - view
    func bind(indexPath: IndexPath, value: [Movie]) {
        self.posterView.load(urlString: value[indexPath.row].url_poster)
        self.titleLabel.text = value[indexPath.row].title
        self.descriptionLabel.text = value[indexPath.row].description
    }

}

extension RecommendationsDetailView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
}
