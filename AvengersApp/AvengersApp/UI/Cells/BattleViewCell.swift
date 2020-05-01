//
//  BattleViewCell.swift
//  AvengersApp
//
//  Created by Miguel Angel de la Torre on 29/04/2020.
//  Copyright © 2020  All rights reserved.
//

import UIKit

class BattleViewCell: UITableViewCell {

    static let cellIdentifier: String = String(describing: BattleViewCell.self)

    
    @IBOutlet weak var battleId: UILabel!
    @IBOutlet weak var battleWinner: UILabel!
    @IBOutlet weak var battleLoser: UILabel!
    
    private var battle: Battle?
    
    override func prepareForReuse() {
        battle = nil
        update(id: nil)
        update(winner: nil)
        update(loser: nil)
    }

    func configure(with battle: Battle) {
        self.battle = battle
        
        update(id: String(battle.battleId))
        update(winner: battle.winner?.name)
        update(loser: battle.loser?.name)
    }
    
    private func update(id: String?) {
        battleId.text = id
    }
    
    private func update(winner: String?) {
        battleWinner.text = winner
    }

    private func update(loser: String?) {
        battleLoser.text = loser
    }


    
    
}
