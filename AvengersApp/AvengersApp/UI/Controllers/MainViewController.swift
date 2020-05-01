//
//  MainViewController.swift
//  AvengersApp
//
//  Created by Miguel Angel de la Torre on 01/05/2020.
//  Copyright © 2020  All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var selector: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBattleButton: UIButton!
    
    // MARK: Actions
    @IBAction func onSelectorPressed(_ sender: UISegmentedControl) {

        updateSelected()
        showData()
    }
    
    @IBAction func addNewBattle(_ sender: Any) {
        
        guard let newBattle =  dataProvider.createBattle() else {
                   return
               }
        
        newBattle.battleId = Int16(battles.count + 1)
        
        let heroesRandomIndex = Int.random(in: 0..<heroes.count)
        let villainRandomIndex = Int.random(in: 0..<villains.count)
        let winsHeroeOrVillain = Int.random(in: 0..<10)
        
        if(winsHeroeOrVillain < 5){
            newBattle.winner = heroes[heroesRandomIndex]
            newBattle.loser = villains[villainRandomIndex]
        } else {
            newBattle.loser = heroes[heroesRandomIndex]
            newBattle.winner = villains[villainRandomIndex]
        }

        dataProvider.saveData()
        
        updateAllData()
        
    }
    
    
    // MARK: - Private methods
    private var dataProvider = DataProvider()
    private var currentSelected: Selection = .heroes

    private var avengers: [Avenger] = []
    private var heroes: [Avenger] = []
    private var villains: [Avenger] = []
    private var battles: [Battle] = []

    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        updateAllData()
    }

    // MARK: - Private methods
    private func loadAllContent() {
 
        avengers = dataProvider.loadAllAvengers()
        if avengers.count == 0 {
            createInitialAvengers()
            avengers = dataProvider.loadAllAvengers()
        }
        if heroes.count == 0 {
            heroes = avengers.filter{ $0.type == "H" }
        }
        if villains.count == 0 {
            villains = avengers.filter{ $0.type == "V" }
        }
        battles = dataProvider.loadAllBattles()
    }
        
    private func updateSelected() {
        currentSelected = Selection(rawValue: selector.selectedSegmentIndex) ?? .heroes
    }
    
    private func showData() {
        tableView.reloadData()
    }
    
    private func updateAllData() {
        loadAllContent()
        updateSelected()
        showData()
    }
    
    private func createInitialAvengers() {
        guard let avengerAmericaCaptain = dataProvider.createAvenger() else {
            return
        }
        avengerAmericaCaptain.avengerId = 0
        avengerAmericaCaptain.descriptio = "Heroe America Captain"
        avengerAmericaCaptain.image = "img_heroe_america_captain"
        avengerAmericaCaptain.name = "America Captain"
        avengerAmericaCaptain.power = "Speed"
        avengerAmericaCaptain.type = "H"
        
        guard let avengerBlackPanther = dataProvider.createAvenger() else {
            return
        }
        avengerBlackPanther.avengerId = 1
        avengerBlackPanther.descriptio = "Heroe Black Panther"
        avengerBlackPanther.image = "img_heroe_black_panther"
        avengerBlackPanther.name = "Black Panther"
        avengerBlackPanther.power = "Force"
        avengerBlackPanther.type = "H"

        guard let avengerBlackWidow = dataProvider.createAvenger() else {
            return
        }
        avengerBlackWidow.avengerId = 2
        avengerBlackWidow.descriptio = "Heroe Black Widow"
        avengerBlackWidow.image = "img_heroe_black_widow"
        avengerBlackWidow.name = "Black Widow"
        avengerBlackWidow.power = "Wisdom"
        avengerBlackWidow.type = "H"

        guard let avengerDrStrange = dataProvider.createAvenger() else {
            return
        }
        avengerDrStrange.avengerId = 3
        avengerDrStrange.descriptio = "Heroe Dr Strange"
        avengerDrStrange.image = "img_heroe_dr_strange"
        avengerDrStrange.name = "Dr Strange"
        avengerDrStrange.power = "Intelligence"
        avengerDrStrange.type = "H"
        
        guard let avengerGamora = dataProvider.createAvenger() else {
            return
        }
        avengerGamora.avengerId = 4
        avengerGamora.descriptio = "Heroe Gamora"
        avengerGamora.image = "img_heroe_gamora"
        avengerGamora.name = "Gamora"
        avengerGamora.power = "Beauty"
        avengerGamora.type = "H"

        guard let avengerHulk = dataProvider.createAvenger() else {
            return
        }
        avengerHulk.avengerId = 5
        avengerHulk.descriptio = "Heroe Hulk"
        avengerHulk.image = "img_heroe_hulk"
        avengerHulk.name = "Hulk"
        avengerHulk.power = "Resistance"
        avengerHulk.type = "H"

        guard let avengerMarvelCaptain = dataProvider.createAvenger() else {
            return
        }
        avengerMarvelCaptain.avengerId = 6
        avengerMarvelCaptain.descriptio = "Heroe Marvel Captain"
        avengerMarvelCaptain.image = "img_heroe_marvel_captain"
        avengerMarvelCaptain.name = "Marvel Captain"
        avengerMarvelCaptain.power = "Vision"
        avengerMarvelCaptain.type = "H"
        
        guard let avengerSpiderman = dataProvider.createAvenger() else {
            return
        }
        avengerSpiderman.avengerId = 7
        avengerSpiderman.descriptio = "Heroe Spiderman"
        avengerSpiderman.image = "img_heroe_spiderman"
        avengerSpiderman.name = "Spiderman"
        avengerSpiderman.power = "Agility"
        avengerSpiderman.type = "H"
        
        guard let avengerThor = dataProvider.createAvenger() else {
            return
        }
        avengerThor.avengerId = 8
        avengerThor.descriptio = "Heroe Thor"
        avengerThor.image = "img_heroe_thor"
        avengerThor.name = "Thor"
        avengerThor.power = "Lightness"
        avengerThor.type = "H"

        guard let avengerYonRogg = dataProvider.createAvenger() else {
            return
        }
        avengerYonRogg.avengerId = 9
        avengerYonRogg.descriptio = "Villain Yon Rogg"
        avengerYonRogg.image = "img_heroe_yon_rogg"
        avengerYonRogg.name = "Yon Rogg"
        avengerYonRogg.power = "Speech"
        avengerYonRogg.type = "V"

        guard let avengerDormammu = dataProvider.createAvenger() else {
            return
        }
        avengerDormammu.avengerId = 10
        avengerDormammu.descriptio = "Villain Dormammu"
        avengerDormammu.image = "img_villain_dormammu"
        avengerDormammu.name = "Dormammu"
        avengerDormammu.power = "Relaxation"
        avengerDormammu.type = "V"
        
        guard let avengerEgo = dataProvider.createAvenger() else {
            return
        }
        avengerEgo.avengerId = 11
        avengerEgo.descriptio = "Villain Ego"
        avengerEgo.image = "img_villain_ego"
        avengerEgo.name = "Ego"
        avengerEgo.power = "Generosity"
        avengerEgo.type = "V"

        guard let avengerHela = dataProvider.createAvenger() else {
            return
        }
        avengerHela.avengerId = 12
        avengerHela.descriptio = "Villain Hela"
        avengerHela.image = "img_villain_hela"
        avengerHela.name = "Hela"
        avengerHela.power = "Invisivility"
        avengerHela.type = "V"
        
        guard let avengerIvanVanko = dataProvider.createAvenger() else {
            return
        }
        avengerIvanVanko.avengerId = 13
        avengerIvanVanko.descriptio = "Villain Ivan Vanko"
        avengerIvanVanko.image = "img_villain_ivan_vanko"
        avengerIvanVanko.name = "Ivan Vanko"
        avengerIvanVanko.power = "Very large arms"
        avengerIvanVanko.type = "V"
        
        guard let avengerJohannSchmidt = dataProvider.createAvenger() else {
            return
        }
        avengerJohannSchmidt.avengerId = 14
        avengerJohannSchmidt.descriptio = "Villain Johann Schmidt"
        avengerJohannSchmidt.image = "img_villain_johann_schmidt"
        avengerJohannSchmidt.name = "Johann Schmidt"
        avengerJohannSchmidt.power = "Very large legs"
        avengerJohannSchmidt.type = "V"

        guard let avengerMalekith = dataProvider.createAvenger() else {
            return
        }
        avengerMalekith.avengerId = 15
        avengerMalekith.descriptio = "Villain Malekith"
        avengerMalekith.image = "img_villain_malekith"
        avengerMalekith.name = "Malekith"
        avengerMalekith.power = "Doesn't need to eat"
        avengerMalekith.type = "V"

        guard let avengerRonan = dataProvider.createAvenger() else {
            return
        }
        avengerRonan.avengerId = 16
        avengerRonan.descriptio = "Villain Ronan"
        avengerRonan.image = "img_villain_ronan"
        avengerRonan.name = "Ronan"
        avengerRonan.power = "Doesn't need to drink"
        avengerRonan.type = "V"
        
        guard let avengerThanos = dataProvider.createAvenger() else {
            return
        }
        avengerThanos.avengerId = 17
        avengerThanos.descriptio = "Vilain Thanos"
        avengerThanos.image = "img_villain_thanos"
        avengerThanos.name = "Thanos"
        avengerThanos.power = "Doesn't need to breath"
        avengerThanos.type = "V"
        
        guard let avengerUtron = dataProvider.createAvenger() else {
            return
        }
        avengerUtron.avengerId = 18
        avengerUtron.descriptio = "Vilain Utron"
        avengerUtron.image = "img_villain_ultron"
        avengerUtron.name = "Utron"
        avengerUtron.power = "Can walk on water"
        avengerUtron.type = "V"
        
        dataProvider.saveData()
    }

}


// MARK: - TableView
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTableView() {
        // Configure tableView delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set footer view for remove empty table view separator lines
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Get task count for current task state selected

        switch currentSelected {
            case .heroes:
                return heroes.count

            case .villains:
                return villains.count

            case .battles:
                return battles.count

        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch currentSelected {
            case .heroes:
                // Get custom cell view AvengerViewCell
                let cell = tableView.dequeueReusableCell(withIdentifier: AvengerViewCell.cellIdentifier,
                                                         for: indexPath) as! AvengerViewCell
                // Get heroes
                if indexPath.row < heroes.count {
                    // Configure current cell view with Heroes data
                    cell.configure(with: heroes[indexPath.row])
                }
                return cell

            case .villains:
                // Get custom cell view AvengerViewCell
                let cell = tableView.dequeueReusableCell(withIdentifier: AvengerViewCell.cellIdentifier,
                                                         for: indexPath) as! AvengerViewCell
                // Get villains
                if indexPath.row < villains.count {
                    // Configure current cell view with Villains data
                    cell.configure(with: villains[indexPath.row])
                }
                return cell

            case .battles:
                // Get custom cell view BattleViewCell
                let cell = tableView.dequeueReusableCell(withIdentifier: BattleViewCell.cellIdentifier,
                                                         for: indexPath) as! BattleViewCell
                // Get battles
                if indexPath.row < battles.count {
                    // Configure current cell view with Battles data
                    cell.configure(with: battles[indexPath.row])
                }
                return cell

        }

    }
}
