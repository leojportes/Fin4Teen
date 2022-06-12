//
//  CoordinatedViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

//public protocol ScreenshotPageNameProtocol {
//    var screenshotPageName: String? { get }
//}
public protocol CoordinatedProtocol: AnyObject {
    var coordinator: CoordinatorProtocol? { get set }
    func setCoordinatorDelegate(_ coordinator: CoordinatorProtocol?)
}

open class CoordinatedViewController: UIViewController, CoordinatedProtocol {
    
    public var coordinator: CoordinatorProtocol?
//    public var screenshotPageName: String?
    
    public init(coordinator: CoordinatorProtocol,
                nibName: String? = nil,
                bundle: Bundle? = nil) {
        super.init(nibName: nibName, bundle: bundle)
        self.coordinator = coordinator
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func setCoordinatorDelegate(_ coordinator: CoordinatorProtocol?) {
        self.coordinator = coordinator
    }
    
    deinit {
        coordinator?.removeCoordinator()
    }
}
