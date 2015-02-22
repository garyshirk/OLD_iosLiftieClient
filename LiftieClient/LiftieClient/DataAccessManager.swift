//
//  DataAccessManager.swift
//  LiftieClient
//
//  Created by Gary Shirk on 2/22/15.
//  Copyright (c) 2015 garyshirk. All rights reserved.
//

import Foundation

class DataAccessManager {
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        
        // NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"liftie.info", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
    
    class func getLiftieDataForId(id: NSString, withSuccess success: ((liftieData: NSData!) -> Void)) {
        var escapedId = id.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        var url = "http://liftie.info/api/resort/\(escapedId!)"
        loadDataFromURL(NSURL(string: url)!, completion:{(data, error) -> Void in
            if let urlData = data {
                success(liftieData: urlData)
            }
        })
    }
}