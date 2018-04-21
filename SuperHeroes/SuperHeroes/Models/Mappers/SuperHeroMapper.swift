//
//  SuperHeroMapper.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 20/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import Foundation

struct SuperHeroMapper: Mapper {
    typealias IN = SuperHeroResponse
    typealias OUT = SuperHero
    
    static func map(input: SuperHeroResponse) -> SuperHero {
        let height = Double(input.height?.replacingOccurrences(of: "m", with: "") ?? "0.0") ?? 0.0
        let groups = (input.groups ?? "").components(separatedBy: ",")
        return SuperHero(name: input.name ?? "",
                         realName: input.realName ?? "",
                         photo: URL(string: input.photo ?? ""),
                         height: height,
                         power: input.power ?? "",
                         abilities: input.abilities ?? "",
                         groups: groups)
    }
}
