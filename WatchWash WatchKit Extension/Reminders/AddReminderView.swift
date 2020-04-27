//
//  AddReminderView.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/16/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import WatchKit
import Foundation
import CoreData


class AddReminderView: WKInterfaceController, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var hourPicker: WKInterfacePicker!
    @IBOutlet weak var minutePicker: WKInterfacePicker!
    @IBOutlet weak var timeOfDayPicker: WKInterfacePicker!
    @IBOutlet weak var timeSelectLabel: WKInterfaceLabel!
    
    let notification = NotificationClass()
    
    
    var container = NSPersistentContainer (name: "DataModel")
    
    
    let hourArray = [01,02,03,04,05,06,07,08,09,10,11,12]

    
    let minuteArray = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59]

    let timeOfDayArray = ["AM", "PM"]
    
    var hourValue = 1
    var minuteValue = 0
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
            minuteItem.title = String(format: ":%02d", $0)
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

        setLabel()

    }
    

    func setLabel () {
        
        let timeFormattedString = String(format: "%02d:%02d", hourValue, minuteValue)
         timeSelectLabel.setText("\(timeFormattedString) \(timeOfDayValue)")
    }
    

    @IBAction func saveReminderButton() {
              
        notification.scheduleANotification(hour: hourValue, minute: minuteValue, tod: timeOfDayValue)
        
        let notification = NotificationEntity(context: container.viewContext)
        notification.hour = Int64(hourValue)
        notification.minute = Int64(minuteValue)
        notification.tod = timeOfDayValue
        container.viewContext.insert(notification)
        
        
        
        print("\(hourValue):\(minuteValue) \(timeOfDayValue)")
        
        
    }
    
    @IBAction func hourSelect(_ value: Int) {
        hourValue = hourArray[value]
        print(hourValue)
        setLabel()
       
    }
    
    @IBAction func minuteSelect(_ value: Int) {
        minuteValue = minuteArray[value]
       setLabel()
    }
    
    @IBAction func timeOfDaySelect(_ value: Int) {
        timeOfDayValue = timeOfDayArray[value]
       setLabel()
        
        
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
