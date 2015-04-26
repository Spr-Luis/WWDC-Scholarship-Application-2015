//
//  ProfileViewController.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 21/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //self.tableView.tableFooterView = UIView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    

    
    // MARK: - Navigation

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
    
    
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 230
        }
        
        return 680
    }
    
    //MARK: UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell!
        
        if indexPath.row == 0{
            cell = tableView.dequeueReusableCellWithIdentifier("headCell", forIndexPath: indexPath) as! HeadProfileTableViewCell
            
            var roundView:UIView = UIView(frame: CGRectMake(0, cell.bounds.size.height/3 * 2, cell.bounds.size.width, cell.bounds.size.height/3))
            
            roundView.backgroundColor = UIColor.whiteColor()
            
            
            var offset:CGFloat = 2.5
            
            var rectBounds:CGRect = CGRectMake(roundView.bounds.origin.x, roundView.bounds.origin.y + roundView.bounds.size.height/2, roundView.bounds.size.width, roundView.bounds.size.height/2)
            var rectPath:UIBezierPath = UIBezierPath(rect: rectBounds)
            
            var ovalBounds:CGRect = CGRectMake(roundView.bounds.origin.x - offset/2, roundView.bounds.origin.y, roundView.bounds.size.width + offset, roundView.bounds.size.height)
            
            var ovalPath:UIBezierPath = UIBezierPath(ovalInRect: ovalBounds)
            
            rectPath.appendPath(ovalPath)
            
            var maskLayer:CAShapeLayer = CAShapeLayer()
            maskLayer.frame = roundView.bounds
            maskLayer.path = rectPath.CGPath
            
            roundView.layer.mask = maskLayer
            cell.addSubview(roundView)
            
            var whiteView:UIView = UIView(frame: CGRectMake(cell.layer.bounds.size.width/2 - 60, 90, 120, 120))
            whiteView.backgroundColor = UIColor.whiteColor()
            whiteView.layer.cornerRadius = 60
            whiteView.layer.masksToBounds = true
            cell.addSubview(whiteView)
            
            var avatar:UIImageView = UIImageView(frame: CGRectMake(cell.layer.bounds.size.width/2 - 50, 100, 100, 100))
            avatar.image = UIImage(named: "luis")
            avatar.layer.cornerRadius = 50
            avatar.layer.masksToBounds = true
            cell.addSubview(avatar)
        }else{
            cell = tableView.dequeueReusableCellWithIdentifier("subCell", forIndexPath: indexPath) as!UITableViewCell
            
        
        }
        
        
        return cell
    }
    
    func configureCell(cell: HeadProfileTableViewCell, forRowAtIndexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    //MARK: Social Action
    
    @IBAction func socialAction(sender: UIButton) {
        switch sender.tag{
        case 1:
            self.performSegueWithIdentifier("webView", sender: "http://www.twitter.com/Spr_Luis")
        case 2:
            self.performSegueWithIdentifier("webView", sender: "http://www.facebook.com/LuisArmandhoo")
        case 3:
            self.performSegueWithIdentifier("webView", sender: "http://github.com/Spr-Luis")
        case 4:
            self.performSegueWithIdentifier("webView", sender: "http://linkedin.com/in/sprluis")
        case 5:
            self.performSegueWithIdentifier("webView", sender: "http://profile.luischavez.me")
        default:
            println()
        }
    }
    
}
