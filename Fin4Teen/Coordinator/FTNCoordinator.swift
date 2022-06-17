//
//  FTNCoordinator.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit
import Foundation

/// - Events that navigate to app screens.
enum Event {
    
    // MARK: - Home screen
    case showMenuScreen
    case showContentsScreen
    case showRecommendationsScreen
    
    // MARK: - Menu screen
    case showAboutScreen
    case showHelpScreen
    case showContactScreen
    case logout
    
    // MARK: - Commons
    case closeAction
    case backAction
    
    // MARK: - Onboarding screen
    
    case showHome
    case showInsta
    case showWeb
    case showSignUpScreen
    case showLoginScreen
    
    // MARK: - Login screen
    case showRecovery
    
    // MARK: - Recovery screen
    case sendRecovery
    
    // MARK: - Contents view
    
    case investments
    case financialMarket
    case aboutMoney
    case criptoCoins
    case stockExchange
    case curiosities
    
    // MARK: - Recommendations
    
    case showRecommendationDetail(selectedIndex: IndexPath)
}

protocol FTNCoordinator {
    var navigationController: UINavigationController? { get set }
    
    func eventOccurred(with type: Event)
    func start()
}

protocol FTNCoordinatedViewController {
    var coordinator: FTNCoordinator? { get set }
}
