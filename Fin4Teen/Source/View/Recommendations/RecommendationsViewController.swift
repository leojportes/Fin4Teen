//
//  RecommendationsViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

final class RecommendationsViewController: UIViewController, FTNCoordinatedViewController {
    
    private let customView = RecommendationsView()
    
    // MARK: - Internal properties
    var coordinator: FTNCoordinator?
    
    // MARK: - Private properties
    private let service: FTNServiceProtocol = FTNService()
    private var viewModel: RecommendationsViewModelProtocol?
    
    // MARK: - Initializer
    static func instantiate(with viewModel: RecommendationsViewModelProtocol = RecommendationsViewModel()) -> RecommendationsViewController {
        let controller = RecommendationsViewController()
        controller.viewModel = viewModel
        return controller
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customView.topFiveHeaderView.collectionView?.reloadData()
        viewModel?.input.viewDidLoad()
        bindProperties()
        setupCustomView()
        view.backgroundColor = .black
    }

    func showDetailView(indexPath: IndexPath, typeRec: TypeRec) {
        coordinator?.eventOccurred(with: .showRecommendationDetail(selectedIndex: indexPath, typeRec: typeRec))
    }

    private func didTapBack() {
        coordinator?.eventOccurred(with: .backAction)
    }
    
    private func setupCustomView() {
        customView.setup(backAction: { [weak self] in
            self?.didTapBack()},
                         showDetailView: { indexPath, type in
            self.showDetailView(indexPath: indexPath, typeRec: type) }
        )
    }

    private func bindProperties() {
        viewModel?.output.topFive.bind(skip: true) { movies in
            self.customView.bindTopFive(value: movies)
        }
        
        viewModel?.output.movies.bind(skip: true) { movies in
            self.customView.bindMovies(value: movies)
        }
        
        viewModel?.output.tvshows.bind(skip: true) { tvshows in
            self.customView.bindTvShows(value: tvshows)
        }
        
        viewModel?.output.books.bind(skip: true) { books in
            self.customView.bindBooks(value: books)
        }
       
    }
    
}
