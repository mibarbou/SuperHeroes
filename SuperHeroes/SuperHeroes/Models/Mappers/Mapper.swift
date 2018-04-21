//
//  Mapper.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 18/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import Foundation

protocol Mapper {
    associatedtype IN
    associatedtype OUT
    static func map(input: IN) -> OUT
}
