//
//  RecoveryPassViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class RecoveryPassViewController: UIViewController, FTNCoordinatedViewController {
    
    // MARK: - Properties
    
    var coordinator: FTNCoordinator?
    
    // MARK: - Private properties
    
    var customView = RecoveryPassView()
    
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
    
    func didTapClose() {
        coordinator?.eventOccurred(with: .closeAction)
    }
    
    func didTapSendRecovery() {
        show(title: "Redefinição solicitada", messsage: "Verifique sua caixa de entrada do email cadastrado.")
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        customView.setup(closeAction: { [weak self] in
            self?.didTapClose()
        }, sendRecovery: { [weak self] in
            self?.didTapSendRecovery()
        })
        
    }
    
    private func show(title: String, messsage: String) {
        let alert = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .cancel) { [weak self] _ in
            self?.coordinator?.eventOccurred(with: .sendRecovery)
        }
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
}
