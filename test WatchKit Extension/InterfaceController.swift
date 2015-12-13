//
//  InterfaceController.swift
//  Final Project  WatchKit Extension
//
//  Created by Nathaniel Konkel on 12/13/15.
//  Copyright © 2015 Nathaniel Konkel. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate
{
    
    @IBOutlet var theWKTable: WKInterfaceTable!
    
    var string = ""
    var session : WCSession! //need to give WCSession a value
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        if WCSession.isSupported()
        {
            self.session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        theWKTable.setNumberOfRows(5, withRowType: "cell")
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject])
    {
        //receiveContentFromPhone.setText(message["blankTFtext"] as! String)
        self.string = message["blankTFtext"] as! String
        for (var i = 0; i < 5; i++)
        {
            let currRow = self.theWKTable.rowControllerAtIndex(i) as! row
            currRow.receiveContentFromPhone.setText(self.string)
            
        }
    }
    
}
