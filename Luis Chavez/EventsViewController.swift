//
//  EventsViewController.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 22/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var backgroundMaskView: UIView!
    @IBOutlet weak var dialogView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var awardImage: UIImageView!
    
    var blur:Bool = false
    var dataEvent: Array<Dictionary<String,String>>!
    var index = 0



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dialogView.alpha = 0

        self.gesture = UIPanGestureRecognizer(target: self, action: "pullDownAction:")
        self.dialogView.addGestureRecognizer(self.gesture)
        animator = UIDynamicAnimator(referenceView: view)
        
        dataEvent = getDataEvent()


    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        if blur != true{
            insertBlurView(backgroundMaskView, style: UIBlurEffectStyle.Dark)
            blur = true
        }

        
        // First Animation
        let scale = CGAffineTransformMakeScale(0.5, 0.5)
        let translate = CGAffineTransformMakeTranslation(0, -200)
        dialogView.transform = CGAffineTransformConcat(scale, translate)

        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: {
            
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformConcat(scale, translate)

            }, completion: { finished in
                
        })
        
        
        backgroundImageView.image = UIImage(named: dataEvent[index]["image"]!)
        titleLabel.text = dataEvent[index]["title"]
        dateLabel.text = dataEvent[index]["date"]
        awardImage.image = UIImage(named: dataEvent[index]["award"]!)
        photo.image = UIImage(named: dataEvent[index]["image"]!)
        descriptionLabel.text = dataEvent[index]["text"]
        
        dialogView.alpha = 1
        


    }
    
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    var animator : UIDynamicAnimator!
    var attachmentBehavior : UIAttachmentBehavior!
    var gravityBehaviour : UIGravityBehavior!
    var snapBehavior : UISnapBehavior!
    
    var gesture: UIPanGestureRecognizer!
    
    func pullDownAction(sender: UIPanGestureRecognizer) {
        
        let myView = dialogView
        let location = sender.locationInView(view)
        let boxLocation = sender.locationInView(dialogView)
        
        if sender.state == UIGestureRecognizerState.Began {
            animator.removeBehavior(snapBehavior)
            
            let centerOffset = UIOffsetMake(boxLocation.x - CGRectGetMidX(myView.bounds), boxLocation.y - CGRectGetMidY(myView.bounds));
            attachmentBehavior = UIAttachmentBehavior(item: myView, offsetFromCenter: centerOffset, attachedToAnchor: location)
            attachmentBehavior.frequency = 0
            
            animator.addBehavior(attachmentBehavior)
        }
        else if sender.state == UIGestureRecognizerState.Changed {
            attachmentBehavior.anchorPoint = location
        }
        else if sender.state == UIGestureRecognizerState.Ended {
            animator.removeBehavior(attachmentBehavior)
            
            snapBehavior = UISnapBehavior(item: myView, snapToPoint: view.center)
            animator.addBehavior(snapBehavior)
            
            let translation = sender.translationInView(view)
            if translation.y > 100 {
                animator.removeAllBehaviors()
                
                var gravity = UIGravityBehavior(items: [dialogView])
                gravity.gravityDirection = CGVectorMake(0, 10)
                animator.addBehavior(gravity)
                
                
                delay(0.3, closure: { () -> () in
                    self.refreshView()
                })
            }
        }
        
    }
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    
    func refreshView() {
        index++
        if index > 5 {
            index = 0
        }
        
        animator.removeAllBehaviors()
        
        snapBehavior = UISnapBehavior(item: dialogView, snapToPoint: view.center)
        attachmentBehavior.anchorPoint = view.center
        
        dialogView.center = view.center
        viewDidAppear(true)
    }
    
    
    // MARK: - Blur
    
    func insertBlurView (view: UIView, style: UIBlurEffectStyle) {
        view.backgroundColor = UIColor.clearColor()
        
        var blurEffect = UIBlurEffect(style: style)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        view.insertSubview(blurEffectView, atIndex: 0)
    }
    
    
    // MARK - Info
    
    func getDataEvent() -> Array<Dictionary<String,String>> {
        
        var data = [
            [
                "title" : "Hack DF",
                "date": "January 24-26, 2014, Mexico City",
                "image" : "hackdfphoto",
                "award" : "hackdf",
                "text"  : "Second place winner in the first hackathon organized by the city government of Mexico, as part of the interdisciplinary team of UNAM Mobile."
            ],
            [
                "title" : "NASA Spaces Apps Challenge",
                "date": "April 11-12, 2014, Mexico City",
                "image" : "nasahack",
                "award" : "nasa",
                "text"  : "Won first place in the hackathon NASA and finalist worldwide with our robot and iPad app, Fobos."
            ],
            [
                "title" : "Stanford Presentation",
                "date": "July, 2014, Palo Alto, CA",
                "image" : "stand",
                "award" : "unamMobile",
                "text"  : "Development Manager app for iOS and OS X presented in conjunction with Libros UNAM at the University of Stanford."
            ],
            [
                "title" : "Hack UNAM",
                "date": "August 29-31, 2014, Mexico City",
                "image" : "hackunam",
                "award" : "unamMobile",
                "text"  : "Mentor of mobile applications in the first hackathon organized within the National Autonomous University of Mexico."
            ],
            [
                "title" : "PodiUM Presentation",
                "date": "September 2, 2014, Mexico City",
                "image" : "podiumphoto",
                "award" : "unamMobile",
                "text"  : "Introducing the first smart jacket linked to an iOS device UNAM Mobile."
            ],
            [
                "title" : "Distrupt SF Hackathon",
                "date": "September 6-7, 2014, San Francisco, CA",
                "image" : "cover",
                "award" : "",
                "text"  : "Participant organized by TechCrunch Hackathon in San Francisco."
            ],


        ]
        
        return data
    }

}
