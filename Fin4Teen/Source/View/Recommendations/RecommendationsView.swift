//
//  RecommendationsView.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class RecommendationsView: UIView, ViewCodeContract {
    
    // MARK: - Properties
    
    var didTapBack: Action?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Viewcode
    
    private lazy var baseView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var navigationBarView: FTNNavigationBarView = {
        let view = FTNNavigationBarView(backgroundColor: UIColor.black,
                                        colorButton: UIColor.setColor(color: .whiteStandart),
                                        colorHorizontalLine: UIColor.setColor(color: .blackColor),
                                        iconRight: UIImage(named: Image.angleLeft.rawValue),
                                        backButtonAction: { [weak self] in
            self?.didTapBack?()
        })
        view.set(title: "Recomendações",
                 color: UIColor.setColor(color: .grayLight),
                 font: UIFont.teenRegularFont.withSize(18))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
  
    
    private lazy var topFiveHeaderView: topFiveCollectionView = {
        let view = topFiveCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
 
    private lazy var moviesCollectionView: MoviesCollectionView = {
        let view = MoviesCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var booksCollectionView: BooksCollectionView = {
        let view = BooksCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var seriesTvCollectionView: SeriesTvCollectionView = {
        let view = SeriesTvCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup viewcode
    
    func setupHierarchy() {
        self.addSubview(baseView)
        baseView.addSubview(scrollView)
        scrollView.addSubview(containerView)
        baseView.addSubview(navigationBarView)
        containerView.addSubview(moviesCollectionView)
        containerView.addSubview(booksCollectionView)
        containerView.addSubview(seriesTvCollectionView)
        containerView.addSubview(viewExemple)
        containerView.addSubview(topFiveHeaderView)
    }
    
    func setupConstraints() {
        
        baseView
            .topAnchor(in: self, padding: 1)
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
        
        navigationBarView
            .topAnchor(in: self)
            .leftAnchor(in: self)
            .rightAnchor(in: self)
            .heightAnchor(70)
        
        topFiveHeaderView
            .topAnchor(in: containerView, attribute: .top, padding: 100)
            .leftAnchor(in: containerView, padding: 10)
            .rightAnchor(in: containerView, padding: 10)
            .heightAnchor(270)
        
        moviesCollectionView
            .topAnchor(in: topFiveHeaderView, attribute: .bottom)
            .leftAnchor(in: containerView)
            .rightAnchor(in: containerView)
            .heightAnchor(240)
        
        seriesTvCollectionView
            .topAnchor(in: moviesCollectionView, attribute: .bottom)
            .leftAnchor(in: containerView)
            .rightAnchor(in: containerView)
            .heightAnchor(240)
        
        booksCollectionView
            .topAnchor(in: seriesTvCollectionView, attribute: .bottom, padding: 2)
            .leftAnchor(in: containerView)
            .rightAnchor(in: containerView)
            .heightAnchor(240)
        
        viewExemple
            .topAnchor(in: booksCollectionView, attribute: .bottom, padding: 30)
            .leftAnchor(in: containerView, padding: 20)
            .rightAnchor(in: containerView, padding: 20)
            .bottomAnchor(in: containerView, padding: 30)
            .heightAnchor(75)
        

    }
    
    lazy var viewExemple: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.setColor(color: .grayDarkest)
        view.roundCorners(cornerRadius: 10)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupConfiguration() { /* empty method */ }
    
    func setup(backAction: @escaping Action) {
        self.didTapBack = backAction
    }
    
}
