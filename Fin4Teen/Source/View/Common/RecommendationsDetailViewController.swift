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
                let model = result[indexPath.row]
                self.customView.bind(indexPath: indexPath, movies: result)
                self.customView.urlNetflix = model.url_netflix
                self.customView.urlAppleTv = model.url_appletv ?? ""
                self.customView.urlPrimeVideo = model.url_amazon ?? ""
                self.customView.shouldDisplayStreamingButton(type: .movie)
                self.customView.showAlert = self.showAlert
            }
            
        case .topFiveMovie:
            viewModel?.output.topFive.bind(skip: true) { result in
                guard let indexPath = self.indexPath else { return }
                let model = result[indexPath.row]
                self.customView.bind(indexPath: indexPath, movies: result)
                self.customView.urlNetflix = model.url_netflix
                self.customView.urlAppleTv = model.url_appletv ?? ""
                self.customView.urlPrimeVideo = model.url_amazon ?? ""
                self.customView.shouldDisplayStreamingButton(type: .topFiveMovie)
                self.customView.showAlert = self.showAlert
                
            }

        case .book:
            viewModel?.output.books.bind(skip: true) { result in
                guard let indexPath = self.indexPath else { return }
                let model = result[indexPath.row]
                self.customView.bind(indexPath: indexPath, books: result)
                self.customView.urlAmazonBooks = model.externalLink
                self.customView.shouldDisplayStreamingButton(type: .book)
                self.customView.showAlert = self.showAlert
            }

        case .tvshows:
            viewModel?.output.tvshows.bind(skip: true) { result in
                guard let indexPath = self.indexPath else { return }
                let model = result[indexPath.row]
                self.customView.bind(indexPath: indexPath, tvShows: result)
                self.customView.shouldDisplayStreamingButton(type: .tvshows)
                self.customView.urlNetflix = model.url_netflix
                self.customView.urlAppleTv = model.url_appletv
                self.customView.urlPrimeVideo = model.url_amazon
                self.customView.showAlert = self.showAlert
            }

        case .none:
            break
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Ops!", message: "Título indisponivel na plataforma selecionada.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }

}
