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
    
    // MARK: - Private properties
    private let service: FTNServiceProtocol = FTNService()
    private var viewModel: RecommendationsViewModelProtocol?
    
    // MARK: - Initializer
    static func instantiate(with viewModel: RecommendationsViewModelProtocol = RecommendationsViewModel(), indexPath: IndexPath) -> RecommendationsDetailViewController {
        let controller = RecommendationsDetailViewController()
        controller.indexPath = indexPath
        controller.viewModel = viewModel
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
        viewModel?.output.movies.bind(skip: true) { result in
            guard let indexPath = self.indexPath else { return }
            self.customView.bind(indexPath: indexPath, value: result)
        }
    }

}
