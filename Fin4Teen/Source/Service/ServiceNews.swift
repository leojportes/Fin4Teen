//
//  ServiceNews.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import Foundation

enum Category: String {
    case business = "business"
    case sport = "sport"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case technology = "technology"
}

protocol ServiceNewsProtocol {
    func requestNewspage(category: Category,
                         completion: @escaping ([Article]) -> Void,
                         errorNetwork: @escaping (NetworkError) -> Void)
}

final class ServiceNews: ServiceNewsProtocol {
    
    func requestNewspage(category: Category,
                         completion: @escaping ([Article]) -> Void,
                         errorNetwork: @escaping (NetworkError) -> Void) {
        let baseUrl = "https://newsapi.org/v2/"
        if let url = URL(string: "\(baseUrl)top-headlines?country=br&category=\(category)&apiKey=64f7fecd9b4c43c382ccc864b7af0401") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let error = error {
                    print("error: \(error)")
                    return
                }
                
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(Results.self, from: data)
                        completion(result.articles)
                        
                    } catch let error {
                        errorNetwork(.jsonInvalid)
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
}
