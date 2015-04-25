//
//  AppViewController.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 23/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {
    
    var dataAplication: Array<Dictionary<String,String>>!
    var blur:Bool = false

    @IBOutlet weak var blurBackground: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var scroll:UIImageOrientation!
    var last:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dataAplication = getDataApp()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        if blur != true{
            insertBlurView(blurBackground, style: UIBlurEffectStyle.Dark)
            blur = true
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "webView"{
            let nav = segue.destinationViewController as! UINavigationController
            let webVC = nav.topViewController as! WebViewController
            webVC.url = sender as! String
        }
        
    }

    
        //MARK: UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAplication.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AppTableViewCell
        cell.titleApp.text = dataAplication[indexPath.row]["title"]
        cell.descriptionApp.text = dataAplication[indexPath.row]["text"]
        cell.iconImage.image = UIImage(named: dataAplication[indexPath.row]["image"]!)

        var status = dataAplication[indexPath.row]["status"]
        
        if status == "Store"{
            cell.statusImage.image = UIImage(named: "iPhoneMini")
            cell.storeLabel.text = "Store"
            cell.statusImage.contentMode = UIViewContentMode.Center
        }else if status == "Dev"{
            cell.statusImage.image = UIImage(named: "toolIcon")
            cell.iconImage.contentMode = UIViewContentMode.ScaleAspectFit
            cell.storeLabel.text = "Dev"
        }else if status == "Open Source"{
            cell.statusImage.image = UIImage(named: "gitIcon")
            cell.iconImage.contentMode = UIViewContentMode.ScaleAspectFit
            cell.storeLabel.text = "Open"
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        cell.setNeedsUpdateConstraints()
        cell.setNeedsLayout()
        
        return cell
    }
    

    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if dataAplication[indexPath.row]["status"] == "Store"{
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
            var alert = UIAlertController(title: "App Store", message: "You want to see the application in the App Store?", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction!) -> Void in
                UIApplication.sharedApplication().openURL(NSURL(string: self.dataAplication[indexPath.row]["url"]!)!)
            }))
            alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Cancel, handler: nil))
            delay(0.3, closure: { () -> () in
                self.presentViewController(alert, animated: true, completion: nil)
            })
            
        }else if dataAplication[indexPath.row]["status"] == "Open Source"{
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
            delay(0.3, closure: { () -> () in
                self.performSegueWithIdentifier("webView", sender: self.dataAplication[indexPath.row]["url"])
            })

        }else{
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            
        }
    }
    
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if tableView.dragging{
            
            
            if scroll == UIImageOrientation.Down{
                let scale = CGAffineTransformMakeScale(0.8, 0.8)
                let translate = CGAffineTransformMakeTranslation(0, -100)
                cell.contentView.transform = CGAffineTransformConcat(scale, translate)
            }else{
                let scale = CGAffineTransformMakeScale(0.8, 0.8)
                let translate = CGAffineTransformMakeTranslation(0, +400)
                cell.contentView.transform = CGAffineTransformConcat(scale, translate)

            }
            
            
            UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: nil, animations: {
                
                let scale = CGAffineTransformMakeScale(1, 1)
                let translate = CGAffineTransformMakeTranslation(0, 0)
                cell.contentView.transform = CGAffineTransformConcat(scale, translate)
                
                }, completion:nil)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        scroll = UIImageOrientation.Down
    }
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func getDataApp() -> Array<Dictionary<String,String>> {
        
        var data = [
            [
                "title" : "Libros UNAM",
                "image" : "IconLibrosUnam",
                "status" : "Store",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : "itms-apps://itunes.apple.com/app/id944566736"
            ],[
                "title" : "LastRoom",
                "image" : "IconLastRoom",
                "status" : "Store",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : "itms-apps://itunes.apple.com/app/id581428383"
            ],
            [
                "title" : "Gasolineras VIP",
                "image" : "IconGas",
                "status" : "Store",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : "itms-apps://itunes.apple.com/app/id861774103"
            ],
            [
                "title" : "Fobos",
                "image" : "IconFobos",
                "status" : "Open Source",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : "https://github.com/Spr-Luis/FOBOS-Mars"
            ],
            [
                "title" : "Adiuvo",
                "image" : "IconAdiuvo",
                "status" : "Open Source",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : "https://github.com/Spr-Luis/Adiuvo"
            ],
            [
                "title" : "Mejora MX",
                "image" : "IconMejora",
                "status" : "Dev",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : "."
            ],
            [
                "title" : "Amnios",
                "image" : "IconAmnios",
                "status" : "Dev",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : "."
            ],
            [
                "title" : "Weekend",
                "image" : "IconWeekend",
                "status" : "Dev",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : ""
            ],
            [
                "title" : "LastRoom for Business",
                "image" : "IconBiz",
                "status" : "Dev",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : "."
            ],
            
            
        ]
        
        return data
    }
    
    // MARK: - Blur
    
    func insertBlurView (view: UIView, style: UIBlurEffectStyle) {
        view.backgroundColor = UIColor.clearColor()
        
        var blurEffect = UIBlurEffect(style: style)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        view.insertSubview(blurEffectView, atIndex: 0)
    }

    
}
