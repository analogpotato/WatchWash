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
    @IBOutlet weak var timeSelectLabel: WKInterfaceLabel!
    
    let notification = NotificationClass()
    
    let hourArray = [01,02,03,04,05,06,07,08,09,10,11,12]

    let minuteArray = [00,15,30,45]

    let timeOfDayArray = ["AM", "PM"]
    
    var hourValue = 1
    var minuteValue = 00
    var timeOfDayValue = "AM"
    var todVariance = 12
    

    
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
            todItem.title = $0
        return todItem
        }
        
        hourPicker.setItems(hourItems)
        minutePicker.setItems(minuteItems)
        timeOfDayPicker.setItems(todItems)

        timeSelectLabel.setText("\(hourValue):\(minuteValue) \(timeOfDayValue)")

    }
    


    @IBAction func saveReminderButton() {
              
        notification.scheduleANotification(hour: hourValue, minute: minuteValue, tod: timeOfDayValue)
        
        print("\(hourValue):\(minuteValue) \(timeOfDayValue)")
        
        
    }
    
    @IBAction func hourSelect(_ value: Int) {
        hourValue = hourArray[value]
        print(hourValue)
        timeSelectLabel.setText("\(hourValue):\(minuteValue) \(timeOfDayValue)")
    }
    
    @IBAction func minuteSelect(_ value: Int) {
        minuteValue = minuteArray[value]
        timeSelectLabel.setText("\(hourValue):\(minuteValue) \(timeOfDayValue)")
    }
    
    @IBAction func timeOfDaySelect(_ value: Int) {
        timeOfDayValue = timeOfDayArray[value]
        timeSelectLabel.setText("\(hourValue):\(minuteValue) \(timeOfDayValue)")
        
        
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
