//
//  MainCoordinator.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import Foundation
import UIKit


class MainCoordinator: FTNCoordinator {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController?
    
    // MARK: - Methods
    
    func start() {
        let controller = OnboardingViewController()
        controller.coordinator = self
        navigationController?.setViewControllers([controller], animated: true)
    }
    
    // MARK: - Routes
    func eventOccurred(with type: Event) {
        
        switch type {
        case .showHome: navigateToHomeScreen()
        case .showMenuScreen: navigateToMenuScreen()
        case .showContentsScreen: navigateToContentScreen()
        case .showAboutScreen: navigateToAboutScreen()
        case .showHelpScreen: navigateTopHelpScreen()
        case .logout: navigateLogout()
        case .showContactScreen: break
        case .closeAction: closeAction()
        case .showInsta: navigateToInstagram()
        case .showWeb: navigateToWebSite()
        case .showSignUpScreen: navigateToSignUpScreen()
        case .showLoginScreen: navigateToLoginScreen()
        case .showRecovery: navigateToRecoveryPass()
        case .sendRecovery: sendRecoveryPass()
        case .showRecommendationsScreen: navigateToRecommandationsScreen()
        case .backAction: backAction()
        case .investments: navigateToInvestiments()
        case .financialMarket: navigateToFinancialMarket()
        case .aboutMoney: navigateToAboutMoney()
        case .criptoCoins: navigateToCriptoCoins()
        case .stockExchange: navigateToStockExchange()
        case .curiosities: navigateToCuriosities()
        case let .showRecommendationDetail(indexPath, typeRec): showRecommendationDetail(indexPath, typeRec)
        case .contentDetail: showContentDetailView()
        }
    }
    
    // MARK: Onboarding screen
    
    private func navigateToSignUpScreen() {
        let controller = SignUpViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToInstagram() {
        ApplicationWeb.shared.open(url: "https://www.instagram.com/fin4teenapp/")
    }
    
    private func navigateToWebSite() {
        ApplicationWeb.shared.open(url: "https://leojportes.github.io/Fin4teenWeb/")
    }
    
    private func navigateToLoginScreen() {
        let controller = LoginViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: Home screen
    
    private func navigateToMenuScreen() {
        let controller = MenuViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToContentScreen() {
        let controller = ContentsHomeViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToRecommandationsScreen() {
        let controller = RecommendationsViewController.instantiate()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: Menu screen
    
    private func navigateLogout() {
        let controller = OnboardingViewController()
        controller.coordinator = self
        navigationController?.popToRootViewController(animated: false)
    }
    
    private func navigateToAboutScreen() {
        /* empty method */
    }
    
    private func navigateTopHelpScreen() {
        /* empty method */
    }
    
    // MARK: - Login screen
    
    private func navigateToRecoveryPass() {
        let controller = RecoveryPassViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToHomeScreen() {
        let controller = HomeViewController.instantiate()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Recovery pass screen
    
    private func sendRecoveryPass() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Commons
    
    private func backAction() {
        navigationController?.popViewController(animated: true)
    }
    
    private func closeAction() {
        navigationController?.popViewController(animated: true)
    }
    
    private func navigateToInvestiments() {
        let controller = InvestimentsViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToFinancialMarket() {
        let controller = FinancialMarketViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToCriptoCoins() {
        let controller = CriptoCoinsViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToAboutMoney() {
        let controller = AboutMoneyViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToStockExchange() {
        let controller = StockExchangeViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToCuriosities() {
        let controller = CuriositiesViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }

    private func showRecommendationDetail(_ indexPath: IndexPath, _ typeRec: TypeRec) {
        let controller = RecommendationsDetailViewController.instantiate(indexPath: indexPath, type: typeRec)
        controller.coordinator = self
        navigationController?.present(controller, animated: true)
    }

    private func showContentDetailView() {
        let controller = ContentDetailViewController()
        controller.coordinator = self
        navigationController?.present(controller, animated: true)
    }
    
}
