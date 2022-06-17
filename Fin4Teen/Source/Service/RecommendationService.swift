//
//  RecommendationService.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import Foundation

protocol FTNServiceProtocol {
    func fetchMovies(completion: @escaping ([Movie]) -> Void)
    func fetchBooks(completion: @escaping ([Book]) -> Void)
    func fetchTvshows(completion: @escaping ([Tvshow]) -> Void)
}

final class FTNService: FTNServiceProtocol {
    
    func fetchMovies(completion: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: StringConstants.Api.movies) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let postsData = try JSONDecoder().decode(Movies.self, from: data)
                DispatchQueue.main.async {
                    completion(postsData.movies)
                }
            }
            catch {
                let error = error
                print(error)
            }
        }.resume()
    }

    func fetchBooks(completion: @escaping ([Book]) -> Void) {
        guard let url = URL(string: StringConstants.Api.books) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let postsData = try JSONDecoder().decode(Books.self, from: data)
                completion(postsData.books)
            }
            catch {
                let error = error
                print(error)
            }
        }.resume()
    }
    
    func fetchTvshows(completion: @escaping ([Tvshow]) -> Void) {
        guard let url = URL(string: StringConstants.Api.tvshow) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let postsData = try JSONDecoder().decode(Tvshows.self, from: data)
                completion(postsData.tvshows)
            }
            catch {
                let error = error
                print(error)
            }
        }.resume()
    }

}
