//
//  ViewController.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 20/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {

    @IBOutlet weak var containerView: UIView!
    
    var oneVC: UIViewController!
    var twoVC: UIViewController!
    var threeVC: UIViewController!
    var fourVC: UIViewController!
    
    var pageViewController:UIPageViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load VC
        oneVC = self.storyboard?.instantiateViewControllerWithIdentifier("oneVC") as! UIViewController
        twoVC = self.storyboard?.instantiateViewControllerWithIdentifier("twoVC") as! UIViewController
        threeVC = self.storyboard?.instantiateViewControllerWithIdentifier("threeVC") as! UIViewController
        fourVC = self.storyboard?.instantiateViewControllerWithIdentifier("fourVC") as! UIViewController
        
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        pageViewController.dataSource = self
        
        self.pageViewController.setViewControllers([oneVC!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = self.containerView.frame
        self.addChildViewController(pageViewController)
        self.containerView.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        
        var preVC: UIViewController!

        if viewController == self.fourVC{
            preVC = self.threeVC
        }
        
        if viewController == self.threeVC{
            preVC = self.twoVC
        }
        
        if viewController == self.twoVC{
            preVC = self.oneVC
        }
        
        return preVC
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
    
        var nextVC: UIViewController!
        
        if viewController == self.oneVC {
            nextVC = self.twoVC
        }
        
        if viewController == self.twoVC {
            nextVC = self.threeVC
        }
        
        if viewController == self.threeVC {
            nextVC = self.fourVC
        }
        
        return nextVC
    }



}

