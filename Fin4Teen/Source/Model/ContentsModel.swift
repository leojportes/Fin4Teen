//
//  ContentsModel.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 04/11/22.
//

import Foundation

struct Content: Decodable {
    let contents: [Contents]
}

struct Contents: Decodable {
    let id: Int?
    let title: String?
    let description: String?
    let release: String?
    let url_poster: String
    let duration: String?
    let url_video: String
}
