//
//  Webcam.swift
//  LiftieClient
//
//  Created by Gary Shirk on 3/3/15.
//  Copyright (c) 2015 garyshirk. All rights reserved.
//

import Foundation
import CoreData

class Webcam: NSManagedObject {
    
    @NSManaged var resortId: String?
    @NSManaged var name: String?
    @NSManaged var imageUrl: String?
    @NSManaged var resort: LiftieClient.Webcam
    
}