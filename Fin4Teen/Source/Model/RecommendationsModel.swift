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
    let duration: String?
    let url_netflix: String
    let url_amazon: String?
    let url_appletv: String?
}

// MARK: - TopFive Movies

struct TopFive: Codable {
    let topFive: [Movie]
}

// MARK: - Books
struct Books: Codable {
    let books: [Book]
}

// MARK: - Book
struct Book: Codable {
    let id: Int?
    let url_poster: String?
    let title: String?
    let description: String?
    let pageCount: String?
    let release: String?
    let externalLink: String?
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
    let release: String?
    let url_poster: String
    let duration: String?
    let url_netflix: String?
    let url_amazon: String?
    let url_appletv: String?
}

// MARK: - Recommendation Type
public enum TypeRec {
    case movie
    case book
    case tvshows
    case topFiveMovie
}
