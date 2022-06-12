//
//  ContentsHomeViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class ContentsHomeViewController: UIViewController, FTNCoordinatedViewController {
    
    // MARK: - Private properties
    
    private let customView = ContentsHomeView()
    
    // MARK: Properties
    
    var coordinator: FTNCoordinator?
    
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
    
    private func didTapMenu() {
        coordinator?.eventOccurred(with: .showMenuScreen)
    }
    
    private func didTapBack() {
        coordinator?.eventOccurred(with: .backAction)
    }
    
    private func didTapContentSection(event: Event) {
        coordinator?.eventOccurred(with: event)
    }
    
    private func setupView() {
        customView.setup(menuAction: { [weak self] in
                            self?.didTapMenu() },
                         backAction: { [weak self] in
                            self?.didTapBack() },
                         investimentAction: { [weak self] in
                            self?.didTapContentSection(event: .investments) },
                         financialMarketAction: { [weak self] in
                            self?.didTapContentSection(event: .financialMarket) },
                         aboutMoneyAction: { [weak self] in
                            self?.didTapContentSection(event: .aboutMoney) },
                         criptoAction: { [weak self] in
                            self?.didTapContentSection(event: .criptoCoins) },
                         stockExchangeAction: { [weak self] in
                            self?.didTapContentSection(event: .stockExchange) },
                         curiositiesAction: { [weak self] in
                            self?.didTapContentSection(event: .curiosities) })
        
        customView.setNumbersOfContents(invest: "13",
                                        financialMarket: "5",
                                        aboutmoney: "8",
                                        criptoCoins: "15",
                                        stockExchange: "10",
                                        curiosities: "30")
    }
    
    
}
