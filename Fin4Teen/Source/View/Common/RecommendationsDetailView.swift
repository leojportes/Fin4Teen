//
//  RecommendationsDetailView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 16/06/22.
//

import UIKit

class RecommendationsDetailView: UIView, ViewCodeContract {
    
    // MARK: - Properties
    var urlStremming: String = ""
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
        image.backgroundColor = .setColor(.grayDarkHigh)
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
    
    private lazy var netFlix: FTNButtonIcon = {
        let button = FTNButtonIcon(image: .icon(.netflix),
                                   backgroundColor: .clear,
                                   accessibility: "netflix",
                                   action: { [weak self] in
            
            ApplicationWeb.shared.open(url: self?.urlStremming ?? "https://www.netflix.com")
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var amazon: FTNButtonIcon = {
        let button = FTNButtonIcon(image: .icon(.prime),
                                   backgroundColor: .clear,
                                   accessibility: "prime vídeo",
                                   action: { [weak self] in
            print("LIKE TAPPED")
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var appleTvButton: FTNButtonIcon = {
        let button = FTNButtonIcon(image: .icon(.appleTv),
                                   backgroundColor: .clear,
                                   accessibility: "apple tv",
                                   action: { [weak self] in
            print("apple TAPPED")
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.teenMediumFont.withSize(15)
        label.textColor = UIColor.setColor(.grayLight)
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
        containerView.addSubview(netFlix)

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
        
        titleLabel
            .topAnchor(in: containerView, padding: 25)
            .leftAnchor(in: posterView, attribute: .right, padding: 15)
            .rightAnchor(in: containerView, padding: 15)
    
        releaseLabel
            .topAnchor(in: titleLabel, attribute: .bottom, padding: 10)
            .leftAnchor(in: posterView, attribute: .right, padding: 15)
            .rightAnchor(in: containerView)
        
        durationLabel
            .topAnchor(in: releaseLabel, attribute: .bottom, padding: 10)
            .leftAnchor(in: posterView, attribute: .right, padding: 15)
            .rightAnchor(in: containerView)
        
        descriptionLabel
            .topAnchor(in: posterView, attribute: .bottom, padding: 25)
            .leftAnchor(in: containerView, padding: 15)
            .rightAnchor(in: containerView, padding: 15)
        
        netFlix
            .topAnchor(in: descriptionLabel, attribute: .bottom, padding: 30)
            .leftAnchor(in: containerView, padding: 15)
            .heightAnchor(60)
            .widthAnchor(65)
            .bottomAnchor(in: containerView, padding: 200)
  
    }
    
    // MARK: Bind model - view
    func bind(indexPath: IndexPath, movies: [Movie]) {
        let model = movies[indexPath.row]
        self.posterView.load(urlString: model.url_poster)
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
        self.releaseLabel.text = model.release
        self.durationLabel.text = model.duration
        
    }
    
    func bind(indexPath: IndexPath, books: [Book]) {
        let model = books[indexPath.row]
        self.posterView.load(urlString: model.url_poster ?? "")
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
        self.releaseLabel.text = model.release
        self.durationLabel.text = model.pageCount
        
    }
    
    func bind(indexPath: IndexPath, tvShows: [Tvshow]) {
        let model = tvShows[indexPath.row]
        self.posterView.load(urlString: model.url_poster)
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
        self.releaseLabel.text = model.release
        self.durationLabel.text = model.duration
    }
    
    func shouldDisplayStreamingButton(show: Bool) {
        netFlix.isHidden = show.not
    }

}

extension RecommendationsDetailView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
}
