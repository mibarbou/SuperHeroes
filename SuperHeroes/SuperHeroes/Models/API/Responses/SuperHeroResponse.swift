//
//  SuperHeroResponse.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 18/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import Gloss

struct SuperHeroResponse: JSONDecodable {
    let name:           String?
    let photo:          String?
    let realName:       String?
    let height:         String?
    let power:          String?
    let abilities:      String?
    let groups:         String?
    
    init?(json: JSON) {
        self.name = "name" <~~ json
        self.photo = "photo" <~~ json
        self.realName = "realName" <~~ json
        self.height = "height" <~~ json
        self.power = "power" <~~ json
        self.abilities = "abilities" <~~ json
        self.groups = "groups" <~~ json
    }
}
