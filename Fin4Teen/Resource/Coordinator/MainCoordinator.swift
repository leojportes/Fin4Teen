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
        var controller: UIViewController & FTNCoordinatedViewController = OnboardingViewController()
        controller.coordinator = self
        navigationController?.setViewControllers([controller], animated: true)
    }
    
    func eventOccurred(with type: Event) {
        
        switch type {
        case .showHome:
            self.navigateToHomeScreen()
        case .showMenuScreen:
            self.navigateToMenuScreen()
        case .showContentsScreen:
            self.navigateToContentScreen()
        case .showAboutScreen:
            self.navigateToAboutScreen()
        case .showHelpScreen:
            self.navigateTopHelpScreen()
        case .logout:
            self.navigateLogout()
        case .showContactScreen:
            break
        case .closeAction:
            self.closeAction()
        case .showInsta:
            self.navigateToInstagram()
        case .showWeb:
            self.navigateToWebSite()
        case .showSignUpScreen:
            self.navigateToSignUpScreen()
        case .showLoginScreen:
            self.navigateToLoginScreen()
        case .showRecovery:
            self.navigateToRecoveryPass()
        case .sendRecovery:
            self.sendRecoveryPass()
        case .showRecommendationsScreen:
            self.navigateToRecommandationsScreen()
        case .backAction:
            self.backAction()
        case .investments:
            self.navigateToInvestiments()
        case .financialMarket:
            self.navigateToFinancialMarket()
        case .aboutMoney:
            self.navigateToAboutMoney()
        case .criptoCoins:
            self.navigateToCriptoCoins()
        case .stockExchange:
            self.navigateToStockExchange()
        case .curiosities:
            self.navigateToCuriosities()
        case .showRecommendationDetail(let indexPath, let typeRec):
            self.showRecommendationDetail(indexPath: indexPath, typeRec: typeRec)
        }
        
    }
    
    // MARK: - Private Methods
    
    
    // MARK: Onboarding screen
    
    private func navigateToSignUpScreen() {
        var controller: UIViewController & FTNCoordinatedViewController = SignUpViewController()
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
        var controller: UIViewController & FTNCoordinatedViewController = LoginViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: Home screen
    
    private func navigateToMenuScreen() {
        var controller: UIViewController & FTNCoordinatedViewController = MenuViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToContentScreen() {
        var controller: UIViewController & FTNCoordinatedViewController = ContentsHomeViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToRecommandationsScreen() {
        var controller: UIViewController & FTNCoordinatedViewController = RecommendationsViewController.instantiate()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: Menu screen
    
    private func navigateLogout() {
        var controller: UIViewController & FTNCoordinatedViewController = OnboardingViewController()
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
        var controller: UIViewController & FTNCoordinatedViewController = RecoveryPassViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToHomeScreen() {
        var controller: UIViewController & FTNCoordinatedViewController = HomeViewController.instantiate()
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
        var controller: UIViewController & FTNCoordinatedViewController = InvestimentsViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToFinancialMarket() {
        var controller: UIViewController & FTNCoordinatedViewController = FinancialMarketViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToCriptoCoins() {
        var controller: UIViewController & FTNCoordinatedViewController = CriptoCoinsViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToAboutMoney() {
        var controller: UIViewController & FTNCoordinatedViewController = AboutMoneyViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToStockExchange() {
        var controller: UIViewController & FTNCoordinatedViewController = StockExchangeViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func navigateToCuriosities() {
        var controller: UIViewController & FTNCoordinatedViewController = CuriositiesViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }

    private func showRecommendationDetail(indexPath: IndexPath, typeRec: TypeRec) {
        var controller: UIViewController & FTNCoordinatedViewController = RecommendationsDetailViewController.instantiate(indexPath: indexPath, type: typeRec)
        controller.coordinator = self
        navigationController?.present(controller, animated: true)
    }
    
}
