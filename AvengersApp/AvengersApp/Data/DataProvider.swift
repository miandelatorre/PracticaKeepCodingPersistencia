//
//  DataProvider.swift
//  AvengersApp
//
//  Created by Miguel Angel de la Torre on 01/05/2020.
//  Copyright © 2020  All rights reserved.
//

import Foundation


class DataProvider {
    private var database: Database? = nil
    private var typeHeroes: String = "H"
    private var typeVillians: String = "V"
    
    
    init() {
        database = Database()
    }
    
    deinit {
        database = nil
    }
    
    
    func createAvenger() -> Avenger? {
        return database?.createAvenger() as? Avenger
    }

    func createBattle() -> Battle? {
        return database?.createBattle() as? Battle
    }

    func saveData() {
        database?.persistData()
    }

    func loadAllAvengers() -> [Avenger] {
        guard let data = database?.fecthAllAvengers() as? [Avenger] else {
            return []
        }
        
        return data
    }
    
    func loadAllBattles() -> [Battle] {
        guard let data = database?.fecthAllBattles() as? [Battle] else {
            return []
        }
        
        return data
    }


    func loadAvengersByType(type: Selection) -> [Avenger] {

        if (type.rawValue == 0) {
            return database?.fetchAvengersByType(type: typeHeroes) as? [Avenger] ?? []
        } else if (type.rawValue == 1) {
            return database?.fetchAvengersByType(type: typeVillians) as? [Avenger] ?? []
        } else {
            return database?.fecthAllAvengers() as? [Avenger] ?? []
        }

    }

}
