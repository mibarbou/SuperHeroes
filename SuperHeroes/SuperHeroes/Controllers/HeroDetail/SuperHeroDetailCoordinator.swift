//
//  SuperHeroDetailCoordinator.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 20/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import UIKit

final class SuperHeroDetailCoordinator: Coordinator {
    
    private let hero: SuperHero
    private unowned let navigationController: UINavigationController
    
    init(hero: SuperHero, navigationController: UINavigationController) {
        self.hero = hero
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewController = SuperHeroDetailViewController(hero: hero)
        navigationController.pushViewController(viewController, animated: true)
    }
}
