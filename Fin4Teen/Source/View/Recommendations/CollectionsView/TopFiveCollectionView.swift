//
//  TopFiveCollectionView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

final class topFiveCollectionView: UIView, ViewCodeContract {
    
    var showDetailView: ((IndexPath) -> Void)?
    
    var movieList: [Movie] = [] {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) var collectionView: UICollectionView?
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150,
                                 height: 205)
        layout.minimumLineSpacing = 10
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        
        
        guard let collectionView = collectionView else { return }
        collectionView.register(RecommendationsCollectionViewCell.self,
                                forCellWithReuseIdentifier: RecommendationsCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Top 5"
        label.textColor = UIColor.setColor(.grayLight)
        label.font = UIFont.teenBoldFont.withSize(23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        self.addSubview(containerView)
        containerView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        
        containerView
            .topAnchor(in: self)
            .leftAnchor(in: self, padding: 10)
            .rightAnchor(in: self)
            .bottomAnchor(in: self)
        
        titleLabel
            .topAnchor(in: containerView, padding: 4)
            .leftAnchor(in: containerView)
        
        collectionView?
            .topAnchor(in: containerView, padding: 20)
            .leftAnchor(in: containerView)
            .rightAnchor(in: containerView)
            .heightAnchor(250)
  
    }
    
    func setupConfiguration() {
        collectionView?.backgroundColor = .black
    }
    
}

// MARK: - Extensions CollectionView

extension topFiveCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendationsCollectionViewCell.identifier, for: indexPath) as? RecommendationsCollectionViewCell else { return UICollectionViewCell() }
        let movies = movieList
        
        let imagesTop = [UIImage(named: Image.one.rawValue),
                         UIImage(named: Image.two.rawValue),
                         UIImage(named: Image.three.rawValue),
                         UIImage(named: Image.four.rawValue),
                         UIImage(named: Image.five.rawValue)]
        
        cell.setupCell(image: movies[indexPath.row].url_poster, topFive: imagesTop[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.showDetailView?(indexPath)
    }

}
