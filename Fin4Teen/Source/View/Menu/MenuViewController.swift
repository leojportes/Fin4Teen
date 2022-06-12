//
//  MenuViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class MenuViewController: UIViewController, FTNCoordinatedViewController {
    
    // MARK: - Private properties
    
    private let customView = MenuView()
    
    // MARK: - Properties
    
    var coordinator: FTNCoordinator?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view = customView
        setupView()
    }
    
    func didTapAbout() {
        print("Navigate About")
      
    }
    
    func didTapHelp() {
        print("Navigate Help")
//        coordinator?.eventOccurred(with: .showContactScreen)
    }
    
    func didTapLogout() {
        print("Navigate Logout")
        coordinator?.eventOccurred(with: .logout)
    }
    
    func didTapClose() {
        print("Navigate Logout")
        coordinator?.eventOccurred(with: .closeAction)
    }
    
    private func setupView() {
        customView.setup(aboutAction: { [weak self] in
                            self?.didTapAbout() },
                         helpAction: { [weak self] in
                            self?.didTapHelp() },
                         logoutAction: { [weak self] in
                            self?.didTapLogout() },
                         closeAction: { [weak self] in
                            self?.didTapClose()
                         })
    }

}
