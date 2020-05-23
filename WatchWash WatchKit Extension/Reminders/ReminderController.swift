//
//  ReminderController.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/16/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import Foundation
import WatchKit



class ReminderViewController: WKInterfaceController {
    
  
    
    
    @IBOutlet weak var reminderTable: WKInterfaceTable!
    
    var reminders = [String]()
    
    func sortedReminders() {
        
        reminders = UserDefaults.standard.stringArray(forKey: "Notifications") ?? []
        
        reminders.sort { s1, s2 in
            let m1 = s1.split(separator: " ").last ?? ""
            let m2 = s2.split(separator: " ").last ?? ""
            return m1 < m2 || ((m1 == m2) && s1 < s2)
        }
        
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        sortedReminders()
        
        reminderTable.setNumberOfRows(reminders.count, withRowType: "reminderRow")
        
        for rowIndex in 0 ..< reminders.count {
                   set(row: rowIndex, to: reminders[rowIndex])
               }
        
        print(reminders)
    
        
        
    }

    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        
    }

    
        func set(row rowIndex: Int, to text: String) {
        guard let row = reminderTable.rowController(at: rowIndex) as? reminderRow else {
            return
        }
        
        row.reminderLabel.setText(text)
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        print(reminders[rowIndex])
        var indexSet = IndexSet()
        let defaults = UserDefaults.standard
        
        
        indexSet.remove(rowIndex)
        
        reminderTable.removeRows(at: indexSet)
        reminders.remove(at: rowIndex)
        
        defaults.set(reminders, forKey: "Notifications")
        reminderTable.setNumberOfRows(reminders.count, withRowType: "reminderRow")
        
        for rowIndex in 0 ..< reminders.count {
                          set(row: rowIndex, to: reminders[rowIndex])
                      }
        
            }


 
    
    override func willActivate() {
        super.willActivate()
        
         sortedReminders()
        
        reminderTable.setNumberOfRows(reminders.count, withRowType: "reminderRow")
               
               for rowIndex in 0 ..< reminders.count {
                               set(row: rowIndex, to: reminders[rowIndex])
                           }
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
        
    }
    
    override func didAppear() {
         sortedReminders()
        reminderTable.setNumberOfRows(reminders.count, withRowType: "reminderRow")
        
        for rowIndex in 0 ..< reminders.count {
                        set(row: rowIndex, to: reminders[rowIndex])
                    }
        
        
    }
    
    
    
    
}
