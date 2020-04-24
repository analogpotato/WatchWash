//
//  NotificationClass.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/24/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import WatchKit
import UserNotifications

class NotificationClass: NSObject, UNUserNotificationCenterDelegate {
    
    
      func scheduleANotification() {
            
            let content = UNMutableNotificationContent()
            content.title = "Time to Wash!"
            content.subtitle = "Times Up!"
            content.body = "Tap the 'Finish' button to stop being notified."
            
            content.categoryIdentifier = "ACTIONS"
            content.sound = UNNotificationSound.default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
    
            let notifyRequest = UNNotificationRequest(identifier: "repeat", content: content, trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            
            center.add(notifyRequest) { ( error: Error?) in
                if let theError = error {
                    print(theError.localizedDescription)
                } else {
                    print("Scheduled OK")
                }
            }
        }
}
