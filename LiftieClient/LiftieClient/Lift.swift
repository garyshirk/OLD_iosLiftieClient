//
//  Lift.swift
//  LiftieClient
//
//  Created by Gary Shirk on 3/3/15.
//  Copyright (c) 2015 garyshirk. All rights reserved.
//

import Foundation
import CoreData

class Lift: NSManagedObject {

    @NSManaged var resortId: String
    @NSManaged var name: String
    @NSManaged var status: String
    @NSManaged var resort: LiftieClient.Resort

}
