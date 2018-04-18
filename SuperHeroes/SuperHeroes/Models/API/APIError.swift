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
