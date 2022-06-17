//
//  HomeViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit
import SkeletonView

class HomeViewController: UIViewController, FTNCoordinatedViewController {
    
    // MARK: - Private properties
    private let customView = HomeView()
    
    // MARK: Properties
    var coordinator: FTNCoordinator?
    
    // MARK: - Private properties
    private let service: ServiceNewsProtocol = ServiceNews()
    private var viewModel: HomeViewModelProtocol?
    
    // MARK: - Initializer
    static func instantiate(with viewModel: HomeViewModelProtocol = HomeViewModel()) -> HomeViewController {
        let controller = HomeViewController()
        controller.viewModel = viewModel
        return controller
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        self.navigationController?.navigationBar.isHidden = true
        setupView()
        bindProperties()
        viewModel?.input.viewDidLoad()
        customView.didPullRefresh = pullRefresh
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Actions
    func didTapMenu() {
        coordinator?.eventOccurred(with: .showMenuScreen)
    }
    
    func didTapRecommendations() {
        coordinator?.eventOccurred(with: .showRecommendationsScreen)
    }
    
    func didTapContents() {
        coordinator?.eventOccurred(with: .showContentsScreen)
    }
    
    // MARK: - Private methods
    private func setupView() {
        customView.setup(menuAction: { [weak self] in
                            self?.didTapMenu() },
                         contentsAction: { [weak self] in
                            self?.didTapContents() },
                         recommendationsAction: { [weak self]
                            in self?.didTapRecommendations()
                         })
    }
    
    private func bindProperties() {
        viewModel?.output.news.bind(skip: true) { result in
            self.customView.newsList = result
            
        }
    }

    private func pullRefresh() {
        bindProperties()
        viewModel?.input.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.customView.tableview.refreshControl?.endRefreshing()
            self.customView.tableview.reloadData()
        }
    }
    
}
