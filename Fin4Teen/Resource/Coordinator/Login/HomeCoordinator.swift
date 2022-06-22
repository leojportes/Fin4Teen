//
//  HomeCoordinator.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

class HomeCoordinator: FTNCoordinator {
    func eventOccurred(with type: Event) {
        
    }
    
    
    var navigationController: UINavigationController?
    
     func start() {
        var controller: UIViewController & FTNCoordinatedViewController = LoginViewController()
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
