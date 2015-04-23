//
//  HeadProfileTableViewCell.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 21/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

class HeadProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var effectView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
