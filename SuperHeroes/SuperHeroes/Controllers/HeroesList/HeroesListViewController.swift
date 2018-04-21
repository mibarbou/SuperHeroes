//
//  HeroesListViewController.swift
//  SuperHeroes
//
//  Created by Michel Barbou Salvador on 17/04/2018.
//  Copyright © 2018 mibarbou. All rights reserved.
//

import UIKit
import PKHUD

class HeroesListViewController: UITableViewController {
    
    private let presenter = HeroesListPresenter()
    var didSelectHero: (SuperHero) -> Void = { _ in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.attachView(view: self)
        presenter.requestSuperHeroes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        let nib = UINib(nibName: SuperHeroCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SuperHeroCell.identifier)
        tableView.backgroundColor = UIColor(named: .bar)
        tableView.rowHeight = 90.0
        tableView.rowHeight = UITableViewAutomaticDimension
        addSegmentedControl()
    }
    
    func addSegmentedControl() {
        let segmentedControl = UISegmentedControl(items: ["by Name", "by Real Name", "by Height"])
        segmentedControl.frame = CGRect(x: 0,
                                        y: 0,
                                        width: 150,
                                        height: 20)
        self.navigationItem.titleView = segmentedControl
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self,
                                   action: #selector(HeroesListViewController.changeValue(sender:)),
                                   for: .valueChanged)
    }
    
    func addRefreshControl() {
        let rc = UIRefreshControl()
        if #available(iOS 10.0, *) {
            tableView.refreshControl = rc
        } else {
            tableView.addSubview(rc)
        }
        tableView.refreshControl?.addTarget(self, action: #selector(HeroesListViewController.reloadRequest), for: .valueChanged)
    }
    
    @objc func reloadRequest() {
        presenter.requestSuperHeroes()
    }

    @objc func changeValue(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            presenter.requestSuperHeroes(order: .name)
        case 1:
            presenter.requestSuperHeroes(order: .realName)
        case 2:
            presenter.requestSuperHeroes(order: .height)
        default:
            break
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.superHeroesCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SuperHeroCell.identifier, for: indexPath) as! SuperHeroCell
        let hero = presenter.superHero(at: indexPath)
        cell.configureWith(hero: hero)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hero = presenter.superHero(at: indexPath)
        didSelectHero(hero)
    }
}


extension HeroesListViewController: HeroesListView {
    func startLoading() {
        HUD.show(.progress)
    }
    
    func finishLoading() {
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.refreshControl?.removeFromSuperview()
        self.tableView.refreshControl = nil
        HUD.hide(animated: true)
    }
    
    func loadData() {
        self.tableView.reloadData()
    }
    
    func showError(title: String, description: String) {
        addRefreshControl()
        HUD.flash(.labeledError(title: title, subtitle: description), delay: 3.0)
    }
}












