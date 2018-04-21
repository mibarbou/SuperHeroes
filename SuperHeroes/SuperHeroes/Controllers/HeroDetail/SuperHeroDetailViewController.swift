//
//  SuperHeroDetailViewController.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 20/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import UIKit
import Kingfisher

class SuperHeroDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var groupsLabel: UILabel!
    
    let hero: SuperHero
    
    init(hero: SuperHero) {
        self.hero = hero
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        self.title = hero.name
        self.realNameLabel.text = hero.realName
        self.imageView.kf.setImage(with: hero.photo)
        self.powerLabel.text = hero.power
        self.abilitiesLabel.text = hero.abilities
        let groupsString = hero.groups.joined(separator: "\n✪")
        self.groupsLabel.text = "✪ " + groupsString
    }

}
