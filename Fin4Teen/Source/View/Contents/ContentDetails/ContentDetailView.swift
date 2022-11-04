//
//  ContentDetailView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 04/11/22.
//

import UIKit

class ContentDetailView: UIView, ViewCodeContract {
    
    // MARK: - Properties
    var urlWatchButton: String = ""
    var showAlert: Action?

    let alphaValue: CGFloat = 0.98
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.setColor(.grayDarkHigh)
        self.alpha = alphaValue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    private lazy var buttonsStackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .white
        stack.roundCorners(cornerRadius: 10)
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

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
        view.backgroundColor = .setColor(.grayDarkHigh)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var posterView: UIImageView = {
        let image = UIImageView()
        image.image = .init(systemName: "play")
        image.backgroundColor = .setColor(.whiteStandart)
        image.isOpaque = false
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
        label.font = .teenBoldFont.withSize(17)
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var releaseLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenMediumFont.withSize(13)
        label.textColor = UIColor.setColor(.grayDarkest)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenMediumFont.withSize(13)
        label.textColor = UIColor.setColor(.grayDarkest)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var watchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Assistir conteúdo", for: .normal)
        button.backgroundColor = .setColor(.grayTeen)
        button.addTarget(self, action: #selector(didTapWatchButton), for: .touchUpInside)
        button.roundCorners(cornerRadius: 10)
        return button
    }()
    
    @objc
    func didTapWatchButton() {
        let url = self.urlWatchButton
        if url == String.empty { self.showAlert?() }
        ApplicationWeb.shared.open(url: url)
    }

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenMediumFont.withSize(15)
        label.textColor = UIColor.setColor(.grayDarkest)
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
        containerView.addSubview(durationLabel)
        containerView.addSubview(watchButton)
    }
    
    func setupConstraints() {
        
        gripView
            .topAnchor(in: self, padding: 10)
            .centerX(in: self)
            .heightAnchor(5)
            .widthAnchor(35)
        
        baseView
            .topAnchor(in: self, padding: 70)
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
            .heightAnchor(140)
            .widthAnchor(190)
            .leftAnchor(in: containerView, padding: 15)
        
        titleLabel
            .topAnchor(in: containerView, padding: 25)
            .leftAnchor(in: posterView, attribute: .right, padding: 10)
            .rightAnchor(in: containerView, padding: 15)
    
        releaseLabel
            .topAnchor(in: titleLabel, attribute: .bottom, padding: 10)
            .leftAnchor(in: posterView, attribute: .right, padding: 10)
            .rightAnchor(in: containerView)
        
        durationLabel
            .topAnchor(in: releaseLabel, attribute: .bottom, padding: 10)
            .leftAnchor(in: posterView, attribute: .right, padding: 15)
            .rightAnchor(in: containerView)
        
        descriptionLabel
            .topAnchor(in: posterView, attribute: .bottom, padding: 25)
            .leftAnchor(in: containerView, padding: 15)
            .rightAnchor(in: containerView, padding: 15)
        
        watchButton
            .leftAnchor(in: containerView, padding: 15)
            .rightAnchor(in: containerView, padding: 15)
            .bottomAnchor(in: containerView, padding: 80)
            .heightAnchor(50)
    }

    // MARK: Bind model - view
    func bind() {
        self.titleLabel.text = "Como começar a investir do zero"
        self.descriptionLabel.text = "Neste vídeo você aprenderá do zero ao avançado, como investir e começar a receber lucro sob seus investimentos."
        self.releaseLabel.text = "14/04/2022"
        self.durationLabel.text = "34:04"
        self.urlWatchButton = "https://www.youtube.com"
    }

}
