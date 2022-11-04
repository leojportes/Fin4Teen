//
//  ContentDetailViewController.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 04/11/22.
//

import UIKit

class ContentDetailViewController: UIViewController, FTNCoordinatedViewController {
    
    // MARK: - Private properties
    
    private let customView = ContentDetailView()
    
    // MARK: Properties
    
    var coordinator: FTNCoordinator?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        customView.bind()
    }
    
}
