//
//  CVTableViewController.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 26/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

private let kTableHeaderHeight: CGFloat = 300.0
private let kTableHeaderCutAway: CGFloat = 80.0


class CVTableViewController: UITableViewController {
    
    var dataEducation: Array<Dictionary<String,String>>!

    
    var scroll:UIImageOrientation!
    var last:CGFloat = 0
    
    
    var headerView: UIView!
    var headerMaskLayer: CAShapeLayer!


    override func viewDidLoad() {
        super.viewDidLoad()

        dataEducation = getDataEducation()
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        let effectiveHeight:CGFloat = kTableHeaderHeight-kTableHeaderCutAway/2
        tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.blackColor().CGColor
        
        headerView.layer.mask = headerMaskLayer
        updateHeaderView()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animateAlongsideTransition({ (context) -> Void in
            [self]
            self.updateHeaderView()
            self.tableView.reloadData()
            }, completion: { (context) -> Void in
        })
    }
    
    
    func updateHeaderView() {
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + kTableHeaderCutAway/2
        }
        
        headerView.frame = headerRect
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 0, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: 0))
        path.addLineToPoint(CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLineToPoint(CGPoint(x: 0, y: headerRect.height-kTableHeaderCutAway))
        headerMaskLayer?.path = path.CGPath
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    //MARK: UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataEducation.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if dataEducation[indexPath.row]["cell"] == "0"{
            // Title
            let cell:TitleTableViewCell = tableView.dequeueReusableCellWithIdentifier("title", forIndexPath: indexPath) as! TitleTableViewCell
            cell.titleLabel.text = dataEducation[indexPath.row]["category"]
            cell.descriptionLabel.text = dataEducation[indexPath.row]["text"]
            return cell
            
        }else{
            // Description
            let cell:DescriptionTableViewCell = tableView.dequeueReusableCellWithIdentifier("description", forIndexPath: indexPath) as! DescriptionTableViewCell
            cell.titleLabel.text = dataEducation[indexPath.row]["title"]
            cell.descriptionLabel.text = dataEducation[indexPath.row]["text"]
            
            if dataEducation[indexPath.row]["final"] == "1"{
                cell.finalSection.hidden = true
            }
            
            return cell
            
        }
        
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if dataEducation[indexPath.row]["cell"] == "0"{
            return 123
        }else{
            return 80
        }
    }
    
    
    //MARK: UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if tableView.dragging{
            
            
            if scroll == UIImageOrientation.Down{
                let scale = CGAffineTransformMakeScale(0.9, 0.9)
                let translate = CGAffineTransformMakeTranslation(0, +400)
                cell.contentView.transform = CGAffineTransformConcat(scale, translate)
                
                UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: nil, animations: {
                    
                    let scale = CGAffineTransformMakeScale(1, 1)
                    let translate = CGAffineTransformMakeTranslation(0, 0)
                    cell.contentView.transform = CGAffineTransformConcat(scale, translate)
                    
                    }, completion:nil)
                
            }
        }
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        
        if last > scrollView.contentOffset.y{
            scroll = UIImageOrientation.Up
        }else if last < scrollView.contentOffset.y{
            scroll = UIImageOrientation.Down
        }
        
        last = scrollView.contentOffset.y
        
    }
    
    func getDataEducation() -> Array<Dictionary<String,String>> {
        
        var data = [
            [
                "category" : "Education",
                "cell" : "0",
                "text"  : "A little about education institutions in which I have formed as a person and professional."
            ],[
                "title" : "National High School # 5, UNAM",
                "cell" : "1",
                "image" : "enp5",
                "final" : "0",
                "text"  : "High school education where I trained as a student of mathematics physical sciences, for 3 years.",
            ],[
                "title" : "Faculty of Engineering, UNAM",
                "cell" : "1",
                "image" : "enp5",
                "final" : "1",
                "text"  : "University where the sixth semester of computer engineering career I currently underway. And I learned things related to programming in iOS and OS X.",
            ],[
                "category" : "Work",
                "cell" : "0",
                "text"  : "The jobs that I have unfolded professionally and applied my knowledge."
            ],[
                "title" : "UNAM Mobile - Testing Analyst",
                "cell" : "1",
                "image" : "enp5",
                "final" : "0",
                "text"  : "Responsible for identifying and defining the tests required for new mobile applications verifying the quality of the products.",
            ],[
                "title" : "UNAM Mobile - iOS Developer",
                "cell" : "1",
                "image" : "enp5",
                "final" : "0",
                "text"  : "Team member iOS developers within UNAM Mobile.",
            ],[
                "title" : "UNAM Mobile - iOS Developer Chief",
                "cell" : "1",
                "image" : "enp5",
                "final" : "0",
                "text"  : "Chief development of iOS applications UNAM Mobile, coordinating the development of applications.",
            ],[
                "title" : "LastRoom - iOS Developer",
                "cell" : "1",
                "image" : "enp5",
                "final" : "1",
                "text"  : "Responsible for updating and supporting the implementation of LastRoom for iOS.",
            ],[
                "category" : "Goals",
                "cell" : "0",
                "text"  : "Some goals I plan to continue to be able to reach them."
            ],[
                "title" : "WWDC",
                "cell" : "1",
                "image" : "enp5",
                "final" : "0",
                "text"  : "Attend a WWDC in San Francisco.",
            ],[
                "title" : "Create a product of High Social Impact",
                "cell" : "1",
                "image" : "enp5",
                "final" : "0",
                "text"  : "Create a product that has a great social impact, which is very helpful and change the way people live.",
            ],[
                "title" : "Learn",
                "cell" : "1",
                "image" : "enp5",
                "final" : "1",
                "text"  : "Continue to learn and become a better person every day.",
            ],
        ]
        
        
        return data
    }
}
