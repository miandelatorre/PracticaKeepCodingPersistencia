//
//  AvengerViewCell.swift
//  AvengersApp
//
//  Created by Miguel Angel de la Torre on 29/04/2020.
//  Copyright © 2020  All rights reserved.
//

import UIKit

class AvengerViewCell: UITableViewCell {

    static let cellIdentifier: String = String(describing: AvengerViewCell.self)
    
    @IBOutlet weak var avengerImage: UIImageView!
    @IBOutlet weak var avengerName: UILabel!
    @IBOutlet weak var avengerDescriptio: UILabel!
    @IBOutlet weak var avengerPower: UILabel!
        
    private var avenger: Avenger?
    
    override func prepareForReuse() {
        avenger = nil
        update(image: nil)
        update(name: nil)
        update(descriptio: nil)
        update(power: nil)
    }
    
    func configure(with avenger: Avenger) {
        self.avenger = avenger

        update(image: avenger.image)
        update(name: avenger.name)
        update(descriptio: avenger.descriptio)
        update(power: avenger.power)
    }

    private func update(image: String?) {
        avengerImage.image = image == nil ? nil : UIImage.init(named: image!)
    }

    private func update(name: String?) {
        avengerName.text = name
    }
    
    private func update(descriptio: String?) {
        avengerDescriptio.text = descriptio
    }

    private func update(power: String?) {
        avengerPower.text = power
    }
    
}
