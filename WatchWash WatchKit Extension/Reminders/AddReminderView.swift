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
    let reminderTable = ReminderViewController()
    let hourArray = [01,02,03,04,05,06,07,08,09,10,11,12]
    let minuteArray = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59]
    let timeOfDayArray = ["AM", "PM"]
    let idString = UUID()
    var hourValue = 1
    var minuteValue = 0
    var timeOfDayValue = "AM"
    var todVariance = 12
    

    func notificationSaved(savedNotification: String) {
        let notificationToSave = savedNotification
            let defaults = UserDefaults.standard
        var items: [String] = defaults.stringArray(forKey: "Notifications") ?? []
            items.append(notificationToSave)
        defaults.set(items, forKey: "Notifications")
        
        print(items)
    }
    
    
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
        
       
        let defaults = UserDefaults.standard
        print(defaults.array(forKey: "Notifications") as Any)
 

    }
  

    func setLabel () {
        
        let timeFormattedString = String(format: "%02d:%02d", hourValue, minuteValue)
         timeSelectLabel.setText("\(timeFormattedString) \(timeOfDayValue)")
    }
    

    @IBAction func saveReminderButton() {

        let formattedString = String(format: "%02d:%02d", hourValue, minuteValue)
        let addedString = "\(formattedString) \(timeOfDayValue)"
        
        notificationSaved(savedNotification: addedString)
        
        notification.scheduleANotification(hour: hourValue, minute: minuteValue, tod: timeOfDayValue, id: idString.uuidString)

        
        dismiss()
        
        print("\(hourValue):\(minuteValue) \(timeOfDayValue)")
        
        
    }
    
    @IBAction func hourSelect(_ value: Int) {
        hourValue = hourArray[value]
        print(hourValue)
        print(idString.uuidString)
        setLabel()
       
    }
    
    @IBAction func minuteSelect(_ value: Int) {
        minuteValue = minuteArray[value]
        print(minuteValue)
        print(idString.uuidString)
       setLabel()
    }
    
    @IBAction func timeOfDaySelect(_ value: Int) {
        timeOfDayValue = timeOfDayArray[value]
        print(timeOfDayValue)
        print(idString.uuidString)
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
