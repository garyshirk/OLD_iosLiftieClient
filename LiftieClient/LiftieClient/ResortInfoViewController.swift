//
//  ResortInfoViewController.swift
//  LiftieClient
//
//  Created by Gary Shirk on 3/6/15.
//  Copyright (c) 2015 garyshirk. All rights reserved.
//

import UIKit
import CoreData

class ResortInfoViewController: UIViewController {

    var resort: Resort? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = resort?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
