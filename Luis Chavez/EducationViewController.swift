//
//  EducationViewController.swift
//  Luis Chavez
//
//  Created by Luis Armando Chávez Soto on 23/04/15.
//  Copyright (c) 2015 me.luischavez. All rights reserved.
//

import UIKit

class EducationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    func getDataEducation() -> Array<Dictionary<String,String>> {
        
        var data = [
            [
                "category" : "Education",
                "cell" : "0",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            ],[
                "title" : "High School",
                "cell" : "1",
                "image" : "enp5",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],[
                "title" : "University",
                "cell" : "1",
                "image" : "enp5",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],[
                "category" : "Work",
                "cell" : "0",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            ],[
                "title" : "UM - Testing",
                "cell" : "1",
                "image" : "enp5",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],[
                "title" : "UM - iOS Dev",
                "cell" : "1",
                "image" : "enp5",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],[
                "title" : "UM - iOS Dev Chief",
                "cell" : "1",
                "image" : "enp5",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],[
                "title" : "LastRoom - iOS Dev",
                "cell" : "1",
                "image" : "enp5",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],[
                "category" : "Goals",
                "cell" : "0",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
            ],[
                "title" : "UM - Testing",
                "cell" : "1",
                "image" : "enp5",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],[
                "title" : "UM - iOS Dev",
                "cell" : "1",
                "image" : "enp5",
                "text"  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ],
        ]

        
        return data
    }
}
