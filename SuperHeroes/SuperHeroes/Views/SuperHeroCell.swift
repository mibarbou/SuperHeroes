//
//  SuperHeroCell.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 20/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import UIKit
import Kingfisher

class SuperHeroCell: UITableViewCell {

    static let identifier = "SuperHeroCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWith(hero: SuperHero) {
        self.nameLabel.text = hero.name
        self.realNameLabel.text = hero.realName
        self.heightLabel.text = "\(hero.height)meters"
        self.heroImageView.kf.setImage(with: hero.photo)
    }
    
}
