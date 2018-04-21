//
//  APIError.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 18/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import Foundation

enum ApiError :Error {
    case server
    case unknown
    case parser
    case noConnection
}

//MARK: - title
extension ApiError {
    var title: String {
        switch self {
        case .server, .unknown, .parser, .noConnection:
            return "Oops"
        }
    }
}

//MARK: - description
extension ApiError {
    var description: String {
        switch self {
        case .server, .unknown, .parser:
            return "Something went wrong"
        case .noConnection:
            return "Check your connection settings and try again"
        }
    }
}

