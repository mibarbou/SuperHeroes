//
//  Endpoint.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 18/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import Foundation
import Alamofire

enum Endpoint {
    case superHeroes()
}

//MARK: - method
extension Endpoint {
    var method: Alamofire.HTTPMethod {
        switch self {
        case .superHeroes:
            return .get
        }
    }
}

//MARK: - path
extension Endpoint {
    var path: String {
        switch self {
        case .superHeroes:
            return APISettings.baseURL + "/bins/bvyob"
        }
    }
}

//MARK: - parameters
extension Endpoint {
    var parameters: [String : String] {
        switch self {
        case .superHeroes:
            return [:]
        }
    }
}
