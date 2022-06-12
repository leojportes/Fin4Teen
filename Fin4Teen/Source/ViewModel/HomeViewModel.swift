//
//  HomeViewModel.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import Foundation

// MARK: - Protocols
protocol HomeViewModelOutputProtocol {
    var news: Bindable<[Article]> { get }
}

protocol  HomeViewModelInputProtocol {
    func viewDidLoad()
}

protocol HomeViewModelProtocol {
    var input: HomeViewModelInputProtocol { get }
    var output: HomeViewModelOutputProtocol { get }
}

final class HomeViewModel: HomeViewModelOutputProtocol {

    // MARK: Private properties
    private let service: ServiceNewsProtocol
    
    var news: Bindable<[Article]> = .init([])
    
    // MARK: - Init
    init(service: ServiceNewsProtocol = ServiceNews()) {
        self.service = service
    }
    
    // MARK: - Private methods
    private func request() {
        service.requestNewspage(category: .business, completion: { (result) in
            DispatchQueue.main.async {
                self.news.value = result
            }
        }) { (error) in
            print("Error: \(error)")
        }
        
    }
    
}

extension HomeViewModel: HomeViewModelInputProtocol {
    func viewDidLoad() {
        request()
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    var input: HomeViewModelInputProtocol { self }
    var output: HomeViewModelOutputProtocol { self }
}
