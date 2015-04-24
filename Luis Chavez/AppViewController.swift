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
        cell.url = dataAplication [indexPath.row]["url"]
        
        return cell
    }
    

    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
    
    
    
    func getDataApp() -> Array<Dictionary<String,String>> {
        
        var data = [
            [
                "title" : "Libros UNAM",
                "image" : "IconLibrosUnam",
                "status" : "Store",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : "https://itunes.apple.com/us/app/libros-unam/id944566736?l=es&ls=1&mt=8"
            ],[
                "title" : "LastRoom",
                "image" : "IconLastRoom",
                "status" : "Store",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : "https://itunes.apple.com/us/app/lastroom/id581428383?l=es&ls=1&mt=8"
            ],
            [
                "title" : "Gasolineras VIP",
                "image" : "IconGas",
                "status" : "Store",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : "https://itunes.apple.com/us/app/gasolineras-vip/id861774103?mt=8&ign-mpt=uo%3D4"
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
                "url" : ""
            ],
            [
                "title" : "Amnios",
                "image" : "IconAmnios",
                "status" : "Dev",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                "url" : ""
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
                "url" : ""
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
