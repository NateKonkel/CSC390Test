//
//  ViewController.swift
//  Final Project 
//
//  Created by Nathaniel Konkel on 12/13/15.
//  Copyright © 2015 Nathaniel Konkel. All rights reserved.
//

import UIKit
import WatchConnectivity
import Parse

class ViewController: UIViewController, WCSessionDelegate {
    
    var session : WCSession!
    @IBOutlet weak var blankTF: UITextField!
    @IBAction func submitButtonPressed(sender: AnyObject) //if button is pressed without text, it will crash
    {
        session.sendMessage(["blankTFtext" : blankTF.text!], replyHandler: nil, errorHandler: nil)
        let testObject = PFObject(className: "TestObject")
        testObject["blankTF"] = blankTF.text
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if WCSession.isSupported()
        {
            self.session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

