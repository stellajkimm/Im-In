//
//  APIController.swift
//  helloworld
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import Foundation

protocol APIControllerProtocol {
    func didReceiveAPIResults(results: NSDictionary)
}

class APIController {
    
    var delegate: APIControllerProtocol?
    
    init() {
        
    }
    
    func loadAllEvents() {
        
//        // The iTunes API wants multiple terms separated by + symbols, so replace spaces with + signs
//        let itunesSearchTerm = searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
//        
//        // Now escape anything else that isn't URL-friendly
//        let escapedSearchTerm = itunesSearchTerm.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        let urlPath = "http://10.0.0.28:3000/events.json"
        let url: NSURL = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if(error) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            var err: NSError?
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
            if(err != nil) {
                // If there is an error parsing JSON, print it to the console
                println("JSON Error \(err!.localizedDescription)")
            }
            self.delegate?.didReceiveAPIResults(jsonResult) // THIS IS THE NEW LINE!!
        })
        task.resume()
    }
    
}