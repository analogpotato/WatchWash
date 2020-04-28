//
//  NotificationClass.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/24/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import WatchKit
import UserNotifications



class NotificationClass: NSObject, UNUserNotificationCenterDelegate  {
      
    
    
    func scheduleANotification(hour:Int, minute:Int, tod: String, id: String) {
            
            let content = UNMutableNotificationContent()
        
            content.title = "Time to Wash!"
            content.subtitle = "Watch Wash Reminder"
            content.body = "Get to a sink and scrub up! It's time to wash your hands. Tap here to start your timer."
            
            content.categoryIdentifier = "ACTIONS"
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.calendar = Calendar.current
        
        if tod == "PM" && hour <= 12 {
            dateComponents.hour = hour + 12
        } else {
            dateComponents.hour = hour
        }
        
//            dateComponents.hour = hour
            dateComponents.minute = minute
        
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
    
            let notifyRequest = UNNotificationRequest(identifier: "repeat", content: content, trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            
            center.add(notifyRequest) { ( error: Error?) in
                if let theError = error {
                    print(theError.localizedDescription)
                } else {
                    print("Scheduled OK \(hour):\(minute)\(tod)\(id)")
                }
            }
        }
    
    
    
    
}
