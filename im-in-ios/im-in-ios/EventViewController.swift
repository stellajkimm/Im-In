//
//  ViewController.swift
//  Im_in
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import UIKit

//
//, APIControllerProtocol
class EventViewController: UIViewController, APIControllerProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var button: UIButton!
    var objects = NSMutableDictionary()
    var apiCtrl = APIController()
    
    func didReceiveAPIResults(results: NSDictionary) {
        println(results)
        println("***")
//        self.objects.addObjectsFrom(results)
        println(results.allKeys)
        var created_events = results.valueForKey("created_events")
        println("***********")
        println(created_events[1])
        
        
//        self.tableView.reloadData()
    }
    
//    STEVENS CODE
//    func didReceiveAPIResults(results: NSArray) {
//        dispatch_async(dispatch_get_main_queue(), {
//            self.objects.addObjectsFromArray(results)
//            self.tableView.reloadData()
//            self.refreshControl.endRefreshing()
//        })
//    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        apiCtrl.loadAllEvents()
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
//        println(objects.count)
//        return objects.count
        return 0
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
//        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as UITableViewCell
//        let object = objects[indexPath.row] as NSDictionary
//        cell.textLabel.text = object["created_events"]["name"] as NSString
//        cell.detailTextLabel.text = object["created_events"]["name"] as NSString
//        return cell
        return nil
    }
    
//    STEVENS CODE
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("ThreadCell", forIndexPath: indexPath) as UITableViewCell
//        
//        let object = objects[indexPath.row] as NSDictionary
//        cell.textLabel.text = object["thread_name"] as NSString
//        cell.detailTextLabel.text = object["topic_name"] as NSString
//        return cell
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCtrl.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


