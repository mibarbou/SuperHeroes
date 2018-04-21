//
//  HeroesListPresenter.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 20/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import Foundation

protocol HeroesListView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func loadData()
    func showError(title: String, description: String)
}

class HeroesListPresenter {
    weak private var view: HeroesListView?
    
    var superHeroes: [SuperHero] = []
    
    init(){}
    
    func attachView(view: HeroesListView){
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func requestSuperHeroes(order: HeroesOrderType = .name) {
        if superHeroes.count > 0 {
            // It's already loaded from Remote
            self.superHeroes = self.order(heroes: self.superHeroes, by: order)
            self.view?.loadData()
            return
        }
        self.view?.startLoading()
        APIClient.superHeroes(success: { [unowned self] response in
            self.view?.finishLoading()
            let heroes = response.map{ SuperHeroMapper.map(input: $0) }
            self.superHeroes = self.order(heroes: heroes, by: order)
            self.view?.loadData()
        }) { error in
            self.view?.showError(title: error.title, description: error.description)
            print(error)
        }
    }
    
    func superHero(at indexPath: IndexPath) -> SuperHero {
        return self.superHeroes[indexPath.row]
    }
    
    func superHeroesCount() -> Int {
        return self.superHeroes.count
    }
}

extension HeroesListPresenter {
    fileprivate func order(heroes: [SuperHero], by order: HeroesOrderType) -> [SuperHero] {
        switch order {
        case .name:
            return heroes.sorted(by: { $0.name < $1.name })
        case .realName:
            return heroes.sorted(by: { $0.realName < $1.realName })
        case .height:
            return heroes.sorted(by: { $0.height > $1.height })
        }
    }
}
