//
//  OnboardingViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//


import UIKit

class OnboardingViewController: UIViewController, FTNCoordinatedViewController {
    
    // MARK: - Properties
    
    var coordinator: FTNCoordinator?
    
    // MARK: - Private properties
    
    private let customView = OnboardingView()
    
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
    
    func didTapLoginButton() {
        coordinator?.eventOccurred(with: .showLoginScreen)
    }
    
    func didTapInstaButton() {
        coordinator?.eventOccurred(with: .showInsta)
    }
    
    func didTapWebSiteButton() {
        coordinator?.eventOccurred(with: .showWeb)
    }
    
    func didTapSignUpButton() {
        coordinator?.eventOccurred(with: .showSignUpScreen)
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        customView.setup(actionLogin: { [weak self] in
                            self?.didTapLoginButton() },
                         actionInsta: { [weak self] in
                            self?.didTapInstaButton() },
                         actionWebSite: { [weak self] in
                            self?.didTapWebSiteButton() },
                         actionSignUp: { [weak self] in
                            self?.didTapSignUpButton()
                         })

    }
    
    
 }
