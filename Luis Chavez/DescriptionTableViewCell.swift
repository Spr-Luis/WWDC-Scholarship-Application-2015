//
//  DescriptionTableViewCell.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 23/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var finalSection: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
