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
    
    @IBOutlet weak var notificationTestButton: WKInterfaceButton!
    
    let notification = NotificationClass()
    
    var itemList: [(String, Int)] = [
        ("Basic Wash", 20),
        ("Full Wash", 30),
        ("Extra Wash", 45),
        ("Whoa There", 60)]

    var pickerValue:Int = 20

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

      
        
        let pickerItems: [WKPickerItem] = itemList.map {
             let pickerItem = WKPickerItem()
             pickerItem.caption = $0.0
             pickerItem.title = String($0.1)
             return pickerItem
             }
             myPicker.setItems(pickerItems)
        
        // Configure interface objects here.
    }
    
    @IBAction func testButtonPushed() {
    
    }
    

    @IBAction func pickerSelect(_ value: Int) {
        pickerValue = itemList[value].1
        print(pickerValue)
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        return pickerValue
    }
    
    @IBAction func menuReminder() {
        pushController(withName: "reminderView", context: nil)
    }
    
    @IBAction func menuPowerWash() {
       pushController(withName: "powerWashView", context: nil)
    }
    
    
    
    override func willActivate() {

        super.willActivate()
    }
    
    override func didDeactivate() {

        super.didDeactivate()
    }

}
