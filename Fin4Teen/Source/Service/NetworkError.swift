//
//  NetworkError.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import Foundation

enum NetworkError {
    case jsonInvalid
    case responseError(error: Error)
}
