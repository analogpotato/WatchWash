//
//  AddReminderView.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/16/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import WatchKit
import Foundation


class AddReminderView: WKInterfaceController {

    @IBOutlet weak var hourPicker: WKInterfacePicker!
    @IBOutlet weak var minutePicker: WKInterfacePicker!
    @IBOutlet weak var timeOfDayPicker: WKInterfacePicker!
    
    
    let hourArray = [1,2,3,4,5,6,7,8,9,10,11,12]
    let minuteArray = [0, 15, 30, 45]
    let timeOfDayArray = ["AM", "PM"]
    
    
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let hourItems: [WKPickerItem] = hourArray.map {
        let hourItem = WKPickerItem()
            hourItem.title = String($0)
        return hourItem
        }
        
        let minuteItems: [WKPickerItem] = minuteArray.map {
             let minuteItem = WKPickerItem()
            minuteItem.title = String($0)
             return minuteItem
             }
        
        let todItems: [WKPickerItem] = timeOfDayArray.map {
            let todItem = WKPickerItem()
            todItem.title = String($0)
            return todItem
        }
        
        hourPicker.setItems(hourItems)
        minutePicker.setItems(minuteItems)
        timeOfDayPicker.setItems(todItems)
//        minutePicker.setItems(minuteArray)
//        timeOfDayPicker.setItems(timeOfDayArray)
        
        // Configure interface objects here.
    }

    @IBAction func saveReminderButton() {
        
        
    }
    
    @IBAction func hourSelect(_ value: Int) {
        
    }
    
    @IBAction func minuteSelect(_ value: Int) {
        
    }
    
    @IBAction func timeOfDaySelect(_ value: Int) {
        
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
