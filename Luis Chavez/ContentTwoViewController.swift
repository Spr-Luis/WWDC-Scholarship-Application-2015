//
//  ContentTwoViewController.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 21/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

class ContentTwoViewController: UIViewController {
    
    
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.headImage.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            
            self.headImage.alpha = 1
            
        })
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
