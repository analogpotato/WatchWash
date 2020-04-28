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
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        reminders = UserDefaults.standard.stringArray(forKey: "Notifications") ?? []
        
        
        reminderTable.setNumberOfRows(reminders.count, withRowType: "reminderRow")
        
        for rowIndex in 0 ..< reminders.count {
                   set(row: rowIndex, to: reminders[rowIndex])
               }
        
        
    }
    
    func reloadData() {
        for rowIndex in 0 ..< reminders.count {
                          set(row: rowIndex, to: reminders[rowIndex])
                      }
    }
    
        func set(row rowIndex: Int, to text: String) {
        guard let row = reminderTable.rowController(at: rowIndex) as? reminderRow else {
            return
        }
        
        row.reminderLabel.setText(text)
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
       
        for rowIndex in 0 ..< reminders.count {
                   set(row: rowIndex, to: reminders[rowIndex])
               }
        
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    
    
}
