//
//  HeroesListCoordinator.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 20/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import UIKit

final class HeroesListCoordinator: Coordinator {
    private unowned let navigationController: UINavigationController
    private let viewController: HeroesListViewController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        viewController = HeroesListViewController()
        
        super.init()
        
        // Present the detail when the user selects a hero
        viewController.didSelectHero = { [weak self] hero in
            guard let `self` = self else {
                return
            }
            let coordinator = SuperHeroDetailCoordinator(hero: hero, navigationController: navigationController)
            self.add(child: coordinator)
            coordinator.start()
        }
    }
    
    override func start() {
        viewController.definesPresentationContext = true
        navigationController.pushViewController(viewController, animated: false)
    }
}

