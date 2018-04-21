//
//  SuperHeroesResponse.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 18/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import Gloss

struct SuperHeroesResponse: JSONDecodable {
    let list:   [SuperHeroResponse]?
    
    init?(json: JSON) {
        guard let list: [SuperHeroResponse] = "superheroes" <~~ json else {
            return nil
        }
        self.list = list
    }
}

