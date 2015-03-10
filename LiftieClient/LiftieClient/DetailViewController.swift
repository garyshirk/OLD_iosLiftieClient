//
//  DetailViewController.swift
//  LiftieClient
//
//  Created by Gary Shirk on 2/22/15.
//  Copyright (c) 2015 garyshirk. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var resort: Resort!
    
    var liftsArr: Array<Lift>!

//    var detailItem: AnyObject? {
//        didSet {
//            // Update the view.
//            self.configureView()
//        }
//    }

    func configureView() {
        
        let context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
        var request = NSFetchRequest(entityName: "Lift")
        
        if self.resort?.id != nil {
            request.predicate = NSPredicate(format: "resortId = %@", self.resort.id!)
            self.liftsArr = context?.executeFetchRequest(request, error: nil) as? [Lift]
            self.tableView?.reloadData()
        }
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
        
        if self.liftsArr == nil {
            return 0
        } else {
            return self.liftsArr.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("liftCellId") as UITableViewCell
        
        let lift = liftsArr[indexPath.row]
        
        cell.textLabel?.text = lift.name

        cell.detailTextLabel?.text = lift.status
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

