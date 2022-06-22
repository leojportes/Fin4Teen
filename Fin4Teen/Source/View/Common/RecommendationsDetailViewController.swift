//
//  RecommendationsDetailViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 16/06/22.
//

import UIKit

class RecommendationsDetailViewController: UIViewController, FTNCoordinatedViewController {
    
    // MARK: - Private properties
    private let customView = RecommendationsDetailView()
    
    // MARK: Properties
    var coordinator: FTNCoordinator?
    private var indexPath: IndexPath?
    private var type: TypeRec?
    
    // MARK: - Private properties
    private let service: FTNServiceProtocol = FTNService()
    private var viewModel: RecommendationsViewModelProtocol?
    
    // MARK: - Initializer
    static func instantiate(with viewModel: RecommendationsViewModelProtocol = RecommendationsViewModel(), indexPath: IndexPath, type: TypeRec) -> RecommendationsDetailViewController {
        let controller = RecommendationsDetailViewController()
        controller.indexPath = indexPath
        controller.viewModel = viewModel
        controller.type = type
        return controller
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        self.navigationController?.navigationBar.isHidden = true
        bindProperties()
        viewModel?.input.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func bindProperties() {
        switch type {
        case .movie:
            viewModel?.output.movies.bind(skip: true) { result in
                guard let indexPath = self.indexPath else { return }
                
                self.customView.bind(indexPath: indexPath, movies: result)
            }
            
        case .topFiveMovie:
            viewModel?.output.topFive.bind(skip: true) { result in
                guard let indexPath = self.indexPath else { return }
                self.customView.bind(indexPath: indexPath, movies: result)
                print(result[indexPath.row].url_netflix)
                self.customView.urlStremming = result[indexPath.row].url_netflix
            }
            
        case .book:
            viewModel?.output.books.bind(skip: true) { result in
                guard let indexPath = self.indexPath else { return }
                self.customView.bind(indexPath: indexPath, books: result)
                self.customView.shouldDisplayStreamingButton(show: false)
            }
            
        case .tvshows:
            viewModel?.output.tvshows.bind(skip: true) { result in
                guard let indexPath = self.indexPath else { return }
                self.customView.bind(indexPath: indexPath, tvShows: result)
            }
        case .none:
            break
        }
    }

}
