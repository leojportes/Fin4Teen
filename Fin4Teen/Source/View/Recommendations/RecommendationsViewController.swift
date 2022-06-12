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
        setupCustomView()
        bindProperties()
        viewModel?.input.viewDidLoad()
        view.backgroundColor = .systemYellow
    }

    private func didTapBack() {
        coordinator?.eventOccurred(with: .backAction)
    }
    
    private func setupCustomView() {
        customView.setup(backAction: { [weak self] in
                            self?.didTapBack() })
    }

    private func bindProperties() {
        viewModel?.output.movies.bind(skip: true) { result in
//            self.customView = result
           print("AQUI movies: ", result)
        }
        
        viewModel?.output.books.bind(skip: true) { result in
//            self.customView = result
           print("AQUI books: ", result)
        }
        
        viewModel?.output.tvshows.bind(skip: true) { result in
//            self.customView = result
           print("AQUI tvshows: ", result)
        }
    }
    
}
