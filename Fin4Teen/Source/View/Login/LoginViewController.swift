//
//  LoginViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//


import UIKit

class LoginViewController: UIViewController, FTNCoordinatedViewController {
    
    // MARK: - Properties
    
    var coordinator: FTNCoordinator?
    
    // MARK: - Private properties
    
    var customView = LoginView()
    
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
    
    func didTapLogin() {
        coordinator?.eventOccurred(with: .showHome)
    }
    
    func didTapClose() {
        coordinator?.eventOccurred(with: .closeAction)
    }
    
    func didTapRecovery() {
        coordinator?.eventOccurred(with: .showRecovery)
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        customView.setup(recoveryPassAction: { [weak self] in
                            self?.didTapRecovery() },
                         didTapClose: { [weak self] in
                            self?.didTapClose() },
                         didTapLogin: { [weak self] in
                            self?.didTapLogin() })
    }
    
}
