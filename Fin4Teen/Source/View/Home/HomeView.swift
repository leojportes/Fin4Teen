//
//  HomeView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class HomeView: UIView, ViewCodeContract {
    
    // MARK: - Properties
    var didTapMenu: Action?
    var didTapContents: Action?
    var didTapRecommendations: Action?
    var didPullRefresh: Action?
    
    var newsList: [Article] = [] {
        didSet {
            tableview.isHidden = false
            spinningCircleView.isHidden = true
            tableview.reloadData()
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.setColor(color: .whiteStandart)
        tableview.refreshControl = UIRefreshControl()
        tableview.refreshControl?.addTarget(self, action: #selector(callPullToRefresh), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    // MARK: - Viewcode
    private lazy var headerView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Fin4teen",
                   font:  UIFont.teenSemiBoldFontButton.withSize(24),
                   colorFont: UIColor.systemGreen,
                   icon: UIImage(named: Image.menuSanduiche.rawValue),
                   action: { [weak self] in
                    self?.didTapMenu?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var contentsSectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Conteúdos",
                   icon: UIImage(named: Image.angleRight.rawValue),
                   action: { [weak self] in
                    self?.didTapContents?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var recommendationsSectionView: FTNCellView = {
        let view = FTNCellView()
        view.setup(title: "Recomendações",
                   icon: UIImage(named: Image.angleRight.rawValue),
                   action: { [weak self] in
                    self?.didTapRecommendations?()
                   })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var tableview: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(HomeNewsTableViewCell.self, forCellReuseIdentifier: HomeNewsTableViewCell.identifier)
        return table
    }()
    
    private lazy var spinningCircleView = FTNSpinningCircleView()
    
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Últimas notícias"
        label.font = UIFont.teenBoldFont.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Setup viewcode
    func setupHierarchy() {
        self.addSubview(headerView)
        self.addSubview(contentsSectionView)
        self.addSubview(recommendationsSectionView)
        self.addSubview(newsTitleLabel)
        self.addSubview(tableview)
    }
    
    func setupConstraints() {
        headerView
            .topAnchor(in: self)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)

        contentsSectionView
            .topAnchor(in: headerView, attribute: .bottom, padding: 70)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
        
        recommendationsSectionView
            .topAnchor(in: contentsSectionView, attribute: .bottom)
            .leftAnchor(in: self, padding: 30)
            .rightAnchor(in: self, padding: 30)
            .heightAnchor(75)
        
        newsTitleLabel
            .topAnchor(in: recommendationsSectionView, attribute: .bottom, padding: 70)
            .leftAnchor(in: self, padding: 20)
            
        tableview
            .topAnchor(in: self, padding: 400)
            .leftAnchor(in: self)
            .rightAnchor(in: self, padding: 20)
            .bottomAnchor(in: self)
    }
    
    func setupConfiguration() {
        tableview.delegate = self
        tableview.dataSource = self
        setupLoading()
    }
    
    func setup(menuAction: @escaping Action,
               contentsAction: @escaping Action,
               recommendationsAction: @escaping Action) {
        self.didTapMenu = menuAction
        self.didTapContents = contentsAction
        self.didTapRecommendations = recommendationsAction
        
        headerView.notifyCount(isHidden: true)
        contentsSectionView.notifyCount(isHidden: true)
        recommendationsSectionView.notifyCount(isHidden: true)
    }
    
    private func setupLoading() {
        if newsList.isEmpty {
            tableview.isHidden = true
            self.addSubview(spinningCircleView)
            spinningCircleView.frame = CGRect(x: self.center.x - 50,
                                              y: 600,
                                              width: 100,
                                              height: 100)
            spinningCircleView.animate()
        }
    }

    @objc private func callPullToRefresh() {
        self.didPullRefresh?()
    }
    
}

// MARK: - Extension UITableView
extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeNewsTableViewCell.identifier, for: indexPath) as? HomeNewsTableViewCell else {
            return UITableViewCell()
        }
        
        let news = newsList[indexPath.row]
        cell.setupCustomCell(image: news.urlToImage ?? String.empty,
                             title: news.title ?? String.empty)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = newsList[indexPath.row].url else { return }
        ApplicationWeb.shared.open(url: url)
    }
    
}
