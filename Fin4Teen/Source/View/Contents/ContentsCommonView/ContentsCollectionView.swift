//
//  ContentsCollectionView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

final class ContentsCollectionView: UIView, ViewCodeContract {
    
    // MARK: - Properties
    var didTapBack: (() -> Void)?
    
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
    
    private var collectionView: UICollectionView?
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: self.frame.width - 20,
                                 height: 230)
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.register(ContentsCollectionViewCell.self,
                                forCellWithReuseIdentifier: ContentsCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
    }

    private lazy var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var navigationBarView: FTNNavigationBarView = {
        let view = FTNNavigationBarView(backgroundColor: UIColor.white,
                                         colorButton: UIColor.setColor(.blackColor),
                                         colorHorizontalLine: UIColor.setColor(.grayMedium),
                                         iconRight: UIImage(named: Image.angleLeft.rawValue),
                                         backButtonAction: { [weak self] in
                                            self?.didTapBack?()
                                         })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        self.addSubview(baseView)
        baseView.addSubview(navigationBarView)
        baseView.addSubview(containerView)
    }
    
    func setupConstraints() {
        
        baseView
            .topAnchor(in: self, padding: 1)
            .leftAnchor(in: self)
            .rightAnchor(in: self)
            .bottomAnchor(in: self, layoutOption: .useMargins)
        
        navigationBarView
            .topAnchor(in: self)
            .leftAnchor(in: self)
            .rightAnchor(in: self)
            .heightAnchor(70)
        
        containerView
            .topAnchor(in: baseView, padding: 60)
            .leftAnchor(in: baseView, padding: 10)
            .rightAnchor(in: baseView, padding: 10)
            .bottomAnchor(in: baseView)
        
        collectionView?
            .topAnchor(in: containerView, padding: 55)
            .leftAnchor(in: containerView)
            .rightAnchor(in: containerView)
            .bottomAnchor(in: containerView)
        
    }
    
    func setupConfiguration() {
        collectionView?.backgroundColor = .white
    }
    
    func setup(backAction: @escaping Action) {
        self.didTapBack = backAction
    }
    
    func setupContestsView(title: String) {
        navigationBarView.set(title: title,
                 color: UIColor.setColor(.blackColor),
                 font: UIFont.teenRegularFont.withSize(18))
    }
    
}

// MARK: - Extensions CollectionView
extension ContentsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentsCollectionViewCell.identifier,
                                                            for: indexPath) as? ContentsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped livros")
    }
    
}
