//
//  ResortInfoViewController.swift
//  LiftieClient
//
//  Created by Gary Shirk on 3/6/15.
//  Copyright (c) 2015 garyshirk. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ResortInfoViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var mapViewContainer: UIView!
    @IBOutlet weak var mkMapView: MKMapView!
    
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var resort: Resort? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationItem.title = resort?.name
        
        // TODO - for now working on the map view, so hide tableview
        mapViewContainer.hidden = false
        tableView.hidden = true
        
        let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(1.0 , 1.0)
        
        let latDegrees = resort?.latitude as Double
        latLabel.text = String(format:"%f", latDegrees)
        
        let longDegrees = resort?.longitude as Double
        longLabel.text = String(format:"%f", longDegrees)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latDegrees, longitude: longDegrees)
        let theRegion:MKCoordinateRegion = MKCoordinateRegionMake(location, theSpan)
        
        self.mkMapView.setRegion(theRegion, animated: true)
        
        var anotation = MKPointAnnotation()
        anotation.coordinate = location
        anotation.title = "The Location"
        anotation.subtitle = "This is the location !!!"
        self.mkMapView.addAnnotation(anotation)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        longPress.minimumPressDuration = 1.0
        self.mkMapView.addGestureRecognizer(longPress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        var touchPoint = gestureRecognizer.locationInView(self.mkMapView)
        var newCoord:CLLocationCoordinate2D = self.mkMapView.convertPoint(touchPoint, toCoordinateFromView: self.mkMapView)
        
        var newAnotation = MKPointAnnotation()
        newAnotation.coordinate = newCoord
        newAnotation.title = "New Location"
        newAnotation.subtitle = "New Subtitle"
        self.mkMapView.addAnnotation(newAnotation)
        
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
