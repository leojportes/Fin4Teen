//
//  AboutMoneyViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

final class AboutMoneyViewController: UIViewController, FTNCoordinatedViewController {
    
    private lazy var customView = ContentsCollectionView(didTapItem: { self.coordinator?.eventOccurred(with: .contentDetail) })

    // MARK: - Internal properties
    
    var coordinator: FTNCoordinator?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        setupCustomView()
        setupView()
        view.backgroundColor = .white
        
    }

    private func setupCustomView() {
        customView.setup(
            backAction: { [weak self] in
                self?.coordinator?.eventOccurred(with: .backAction)
            }
        )
    }
    
    func setupView() {
        customView.setupContestsView(title: "Sobre o seu dinheiro")
    }
    
}
