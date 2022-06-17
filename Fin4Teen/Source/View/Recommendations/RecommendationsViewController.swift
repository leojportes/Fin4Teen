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
        setupCustomView()
        customView.topFiveHeaderView.collectionView?.reloadData()
        viewModel?.input.viewDidLoad()
        bindProperties()
        view.backgroundColor = .systemYellow
    }

    func showDetailView(indexPath: IndexPath) {
        coordinator?.eventOccurred(with: .showRecommendationDetail(selectedIndex: indexPath))
    }

    private func didTapBack() {
        coordinator?.eventOccurred(with: .backAction)
    }
    
    private func setupCustomView() {
        customView.setup(backAction: { [weak self] in
            self?.didTapBack() },
                         showDetailView: { indexPath in
            
            print(indexPath.row)
            self.showDetailView(indexPath: indexPath) }
        )
    }

    private func bindProperties() {
        viewModel?.output.movies.bind(skip: true) { result in
            self.customView.bindMovies(value: result)
        }
        
        viewModel?.output.books.bind(skip: true) { result in
        }
        
        viewModel?.output.tvshows.bind(skip: true) { result in
        }
    }
    
}
