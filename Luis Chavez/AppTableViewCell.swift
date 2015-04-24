//
//  AppTableViewCell.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 23/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleApp: UILabel!
    @IBOutlet weak var descriptionApp: UILabel!
    
    @IBOutlet weak var storeButton: UIButton!
    @IBOutlet weak var storeLabel: UILabel!
    
    var url:String!
    
    
    
    @IBAction func storeAction(sender: UIButton) {
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
