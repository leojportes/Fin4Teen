//
//  RecommendationsModel.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import Foundation

// MARK: - Recommendations
struct Movies: Codable {
    let movies: [Movie]
}

// MARK: - Recommendation
struct Movie: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let release: String?
    let url_poster: String
    let url_netflix: String?
    let url_amazon: String?
    let url_appletv: String?
}

// MARK: - Books
struct Books: Codable {
    let books: [Book]
}

// MARK: - Book
struct Book: Codable {
    let id: Int?
    let title: String?
    let description: String?
}

// MARK: - Tvshows
struct Tvshows: Codable {
    let tvshows: [Tvshow]
}

// MARK: - Book
struct Tvshow: Codable {
    let id: Int?
    let title: String?
    let description: String?
}
