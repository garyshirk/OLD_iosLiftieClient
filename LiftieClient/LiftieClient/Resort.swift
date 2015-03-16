//
//  Resort.swift
//  LiftieClient
//
//  Created by Gary Shirk on 2/22/15.
//  Copyright (c) 2015 garyshirk. All rights reserved.
//

import Foundation
import CoreData

class Resort: NSManagedObject {

    @NSManaged var id: String?
    @NSManaged var name: String?
    @NSManaged var conditions: String?
    @NSManaged var temperature: String?
    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var liftTimestamp: NSDate?
    @NSManaged var lifts: LiftieClient.Lift
    @NSManaged var webcams: LiftieClient.Webcam

}
