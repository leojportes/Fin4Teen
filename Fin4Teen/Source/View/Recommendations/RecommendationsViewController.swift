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
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        setupCustomView()
        view.backgroundColor = .systemYellow
        
    }

    private func didTapBack() {
        coordinator?.eventOccurred(with: .backAction)
    }
    
    private func setupCustomView() {
        customView.setup(backAction: { [weak self] in
                            self?.didTapBack() })
    }
    
}
