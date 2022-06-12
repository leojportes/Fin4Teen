//
//  CoordinatorConfiguration.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

public class CoordinatorConfiguration {
    
    public weak var window: UIWindow?
    public weak var navigationController: UINavigationController?
    public weak var viewController: UIViewController?
    public weak var view: UIView?
    
    public init(window: UIWindow? = nil,
                viewController: UIViewController? = nil,
                navigationController: UINavigationController? = nil,
                view: UIView? = nil) {
        self.window = window
        self.navigationController = navigationController
        self.viewController = viewController
        self.view = view
    }
}
