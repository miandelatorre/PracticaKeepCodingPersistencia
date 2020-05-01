//
//  Database.swift
//  AvengersApp
//
//  Created by Miguel Angel de la Torre on 01/05/2020.
//  Copyright © 2020  All rights reserved.
//

import UIKit
import CoreData


class Database {
    // MARK: - Properties
    private let entityAvenger = "Avenger"
    private let entityAvengerId = "avengerId"
    private let entityAvengerDescriptio = "descriptio"
    private let entityAvengerImage = "image"
    private let entityAvengerName = "name"
    private let entityAvengerPower = "power"
    private let entityAvengerType = "type"
    private let entityAvengerBattlesLosed = "battlesLosed"
    private let entityAvengerBattlesWinned = "battlesWinned"

    private let entityBattle = "Battle"
    private let entityBattleId = "battleId"
    private let entityBattleLoser = "loser"
    private let entityattleWinner = "winner"
    
    // MARK: - Managed Object Context
    private func context() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
         
        return appDelegate.persistentContainer.viewContext
    }
    
    
    // MARK: - Database methods
    func createAvenger() -> NSManagedObject? {
        guard let contextMOB = context(),
              let entity = NSEntityDescription.entity(forEntityName: entityAvenger,
                                                      in: contextMOB) else {
            return nil
        }
        
        return Avenger(entity: entity,
                    insertInto: context())
    }

    func createBattle() -> NSManagedObject? {
        guard let contextMOB = context(),
              let entity = NSEntityDescription.entity(forEntityName: entityBattle,
                                                      in: contextMOB) else {
            return nil
        }
        
        return Battle(entity: entity,
                    insertInto: context())
    }

    //borrar
    func persistData() {
        guard let contextMOB = context() else {
            return
        }
        
        try? contextMOB.save()
    }
    
    //borrar
    func fecthAllAvengers() -> [NSManagedObject]? {
        return try? context()?.fetch(NSFetchRequest<NSFetchRequestResult>(entityName: entityAvenger)) as? [NSManagedObject]
    }

    func fecthAllBattles() -> [NSManagedObject]? {
        return try? context()?.fetch(NSFetchRequest<NSFetchRequestResult>(entityName: entityBattle)) as? [NSManagedObject]
    }

    //borrar
    func fetchAvengersByType(type: String) -> [NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityAvenger)
        fetchRequest.predicate = NSPredicate(format: "type = \(type)")
        
        return try? context()?.fetch(fetchRequest) as? [NSManagedObject]
    }

    
    func delete(data: [NSManagedObject]) {
        let contextMOB = context()
        data.forEach{ contextMOB?.delete($0) }
        
        print("Deleted objects: \(String(describing: contextMOB?.deletedObjects))")
        try? contextMOB?.save()
    }
    
}
