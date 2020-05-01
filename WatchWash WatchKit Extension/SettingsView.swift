//
//  PowerWashView.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/24/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import WatchKit
import Foundation


class SettingsView: WKInterfaceController {

    @IBOutlet weak var pickerTime: WKInterfacePicker!
    @IBOutlet weak var savePickerButton: WKInterfaceButton!
    
    var itemList: [(String, Int)] = [
    ("Basic Wash", 20),
    ("Full Wash", 30),
    ("Extra Wash", 45),
    ("Whoa There", 60)]

    var pickerValue:Int = 20
       let defaults = UserDefaults.standard
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        let pickerItems: [WKPickerItem] = itemList.map {
                   let pickerItem = WKPickerItem()
                   pickerItem.caption = $0.0
                   pickerItem.title = String($0.1)
                   return pickerItem
                   }
                   pickerTime.setItems(pickerItems)
        
        
    }
    @IBAction func pickerSelect(_ value: Int) {
        pickerValue = itemList[value].1
        

        print(pickerValue)
        
    }
    
    @IBAction func saveButtonPressed() {
        defaults.set(pickerValue, forKey: "Timer")
//        print(defaults.object(forKey: "Timer")!)
        popToRootController()
    }
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
