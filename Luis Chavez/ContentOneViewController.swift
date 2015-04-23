//
//  ContentOneViewController.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 21/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

class ContentOneViewController: UIViewController {
    
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    

    var animation:Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.headImage.layer.borderColor = UIColor(red:0.22, green:0.54, blue:0.98, alpha:1).CGColor
        self.headImage.layer.borderWidth = 3.0
        
        self.headImage.alpha = 0

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        if animated != true{
            // First Animation
            let scale = CGAffineTransformMakeScale(0.5, 0.5)
            let translate = CGAffineTransformMakeTranslation(0, -300)
            headImage.transform = CGAffineTransformConcat(scale, translate)
            
            
            UIView.animateWithDuration(0.7, animations: { () -> Void in
                
                let scale = CGAffineTransformMakeScale(1, 1)
                let translate = CGAffineTransformMakeTranslation(0, 0)
                self.headImage.transform = CGAffineTransformConcat(scale, translate)
                
                self.headImage.alpha = 1
                
            })
            
            animation = true
        }
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
