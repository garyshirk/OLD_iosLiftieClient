//
//  DetailViewController.swift
//  LiftieClient
//
//  Created by Gary Shirk on 2/22/15.
//  Copyright (c) 2015 garyshirk. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var resort: Resort!
    
    var lifts: [String] = ["lift1", "lift2", "lift3"]


//    var detailItem: AnyObject? {
//        didSet {
//            // Update the view.
//            self.configureView()
//        }
//    }

    func configureView() {
        
        self.tableView.reloadData()
        
 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lifts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("liftCellId") as UITableViewCell
        cell.textLabel?.text = lifts[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

