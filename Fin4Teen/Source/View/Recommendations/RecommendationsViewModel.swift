//
//  RecommendationsViewModel.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import Foundation

// MARK: - Protocols
protocol RecommendationsViewModelOutputProtocol {
    var movies: Bindable<[Movie]> { get }
    var books: Bindable<[Book]> { get }
    var tvshows: Bindable<[Tvshow]> { get }
}

protocol  RecommendationsViewModelInputProtocol {
    func viewDidLoad()
}

protocol RecommendationsViewModelProtocol {
    var input: RecommendationsViewModelInputProtocol { get }
    var output: RecommendationsViewModelOutputProtocol { get }
}

final class RecommendationsViewModel: RecommendationsViewModelOutputProtocol {

    // MARK: Private properties
    private let service: FTNServiceProtocol
    
    var movies: Bindable<[Movie]> = .init([])
    var books: Bindable<[Book]> = .init([])
    var tvshows: Bindable<[Tvshow]> = .init([])
    
    // MARK: - Init
    init(service: FTNServiceProtocol = FTNService()) {
        self.service = service
    }
    
    // MARK: - Private methods
    
    /// Fetch movies data from API
    private func fetchMovies() {
        service.fetchMovies { result in
            DispatchQueue.main.async {
                print(result)
                self.movies.value = result
            }
        }
    }
    
    /// Fetch books data from API
    private func fetchBooks() {
        service.fetchBooks { result in
            DispatchQueue.main.async {
                self.books.value = result
            }
        }
    }

    /// Fetch tvshows data from API
    private func fetchTvShows() {
        service.fetchTvshows { result in
            DispatchQueue.main.async {
                self.tvshows.value = result
            }
        }
    }
}

extension RecommendationsViewModel: RecommendationsViewModelInputProtocol {
    func viewDidLoad() {
        fetchMovies()
    }
}

extension RecommendationsViewModel: RecommendationsViewModelProtocol {
    var input: RecommendationsViewModelInputProtocol { self }
    var output: RecommendationsViewModelOutputProtocol { self }
}
