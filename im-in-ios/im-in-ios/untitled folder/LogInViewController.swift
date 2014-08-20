//
//  ViewController.swift
//  Im_in
//
//  Created by fahia mohamed on 2014-08-14.
//  Copyright (c) 2014 fahia mohamed. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, APILogInControllerProtocol, NSURLConnectionDataDelegate, NSURLConnectionDelegate {
    

    
//    let alert = UIAlertView()
    var apiCtrl = APILogInController()
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    @IBOutlet var label: UILabel!
    
    
    override func viewDidLoad() {
    }
    
    func didReceiveAPIResults(results: NSDictionary) {
    println("LogInViewController#didReceiveAPIResults")
        
        println("************")
        
        println(results.objectForKey("response"))
        
        if (results.objectForKey("response") as String == "Logged in" as String) {
            let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
            appDelegate.currentUser = results.objectForKey("id")
            dispatch_async(dispatch_get_main_queue(),{
                self.performSegueWithIdentifier("logged" as String, sender: self)
            })

        } else {
            println(label.text)
            label.textColor = UIColor.redColor()
            println("NOT LOGGED IN")
        }
    }
    
//    func shouldPerformSegueWithIdentifier(identifier: "logged" as String, sender: AnyObject!) -> Bool {
//        
//    }
    
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        println("pressed")

        var params = ["username": usernameField.text, "password": passwordField.text] as Dictionary
        apiCtrl.delegate = self
        apiCtrl.sendLogInInfo(params)
    }
}


