//
//  APIClient.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 18/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    fileprivate static let manager: SessionManager = {
        return Alamofire.SessionManager.default
    }()
    fileprivate static let headers = ["Content-type": "application/x-www-form-urlencoded"]
    
    fileprivate static func request(endpoint: Endpoint,
                                    success: @escaping ([String : Any])->(),
                                    fail: @escaping (ApiError)->()) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let _ = APIClient.manager.request(endpoint.path,
                                          method: endpoint.method,
                                          parameters: endpoint.parameters,
                                          encoding: URLEncoding.default,
                                          headers: headers)
            .responseJSON { response in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                switch response.result {
                case .success(let json):
                    debugPrint(json)
                    guard let theJson = json as? [String : Any] else {
                        fail(.parser)
                        return
                    }
                    success(theJson)
                case .failure(let error):
                    print("Request failed with error: \(error)")
                    if let errorCode = response.error?._code,
                        Int(errorCode) == -1009{
                        fail(ApiError.noConnection)
                    } else {
                        fail(ApiError.unknown)
                    }
                }
        }
    }
}


//MARK: - Public
extension APIClient {
    public static func superHeroes(success: @escaping ([SuperHeroResponse])->(),
                     fail: @escaping (ApiError)->()) {
        self.request(endpoint: .superHeroes(),
                     success: { response in
                        guard let superHeroesResponse = SuperHeroesResponse(json: response) else {
                            fail(.parser)
                            return
                        }
            success(superHeroesResponse.list ?? [])
        }) { error in
            fail(error)
        }
    }
}



