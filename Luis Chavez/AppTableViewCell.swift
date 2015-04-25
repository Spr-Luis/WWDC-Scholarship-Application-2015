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
    
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    
    @IBOutlet weak var cardView: UIView!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        if animated{
        
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.cardView.transform = CGAffineTransformConcat(scale, translate)
            
            
            UIView.animateWithDuration(0.15, animations: { () -> Void in
                let scale = CGAffineTransformMakeScale(1.2, 1.2)
                let translate = CGAffineTransformMakeTranslation(0, 0)
                self.cardView.transform = CGAffineTransformConcat(scale, translate)

            }, completion: { (void) -> Void in
                
                UIView.animateWithDuration(0.075, animations: { () -> Void in
                    let scale = CGAffineTransformMakeScale(1, 1)
                    let translate = CGAffineTransformMakeTranslation(0, 0)
                    self.cardView.transform = CGAffineTransformConcat(scale, translate)
                })
                
            })
        
        } else{
            
            UIView.animateKeyframesWithDuration(0.2,
                delay: 0,
                options: UIViewKeyframeAnimationOptions.BeginFromCurrentState,
                animations: {
                    UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/4, animations: {
                        self.cardView.transform = CGAffineTransformMakeTranslation(-5, 0)
                    })
                    UIView.addKeyframeWithRelativeStartTime(1/4, relativeDuration: 1/4, animations: {
                        self.cardView.transform = CGAffineTransformMakeTranslation(5, 0)
                    })
                    UIView.addKeyframeWithRelativeStartTime(2/4, relativeDuration: 1/4, animations: {
                        self.cardView.transform = CGAffineTransformMakeTranslation(-5, 0)
                    })
                    UIView.addKeyframeWithRelativeStartTime(3/4, relativeDuration: 1/4, animations: {
                        self.cardView.transform = CGAffineTransformMakeTranslation(5, 0)
                    })
                },
                completion: { (success: Bool) -> Void in
                    
                }
            )

        
        }
    }

}
