//
//  InterfaceController.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/14/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import WatchKit
import Foundation



class InterfaceController: WKInterfaceController {
 
    
    
    @IBOutlet weak var myPicker: WKInterfacePicker!
    @IBOutlet weak var selectLabel: WKInterfaceLabel!
    @IBOutlet weak var startButton: WKInterfaceButton!
    @IBOutlet weak var buttonGroup: WKInterfaceGroup!
    


    let notification = NotificationClass()
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        buttonGroup.setCornerRadius(65)
      
        print("I'm awake")
    }


    @IBAction func starButtonPressed() {

    }
    
    
    @IBAction func menuReminder() {
        pushController(withName: "reminderView", context: nil)
    }
    
    @IBAction func menuPowerWash() {
       pushController(withName: "settingsView", context: nil)
    }
    
    

    
    
    
    
    override func willActivate() {

        super.willActivate()
    }
    
    override func didDeactivate() {

        super.didDeactivate()
    }

}
