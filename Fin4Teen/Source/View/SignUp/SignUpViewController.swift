//
//  SignUpViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class SignUpViewController: UIViewController, FTNCoordinatedViewController {
    
    // MARK: - Properties
    
    var coordinator: FTNCoordinator?
    
    // MARK: - Private properties
    
    var customView = SignUpView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        self.navigationController?.navigationBar.isHidden = true
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Actions
    
    func didTapSignUp() {
        coordinator?.eventOccurred(with: .showHome)
    }
    
    func didTapClose() {
        coordinator?.eventOccurred(with: .closeAction)
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        customView.setup(didTapClose: { [weak self] in
                            self?.didTapClose() },
                         didTapSignUp: { [weak self] in
                            self?.didTapSignUp() })
    }
}
