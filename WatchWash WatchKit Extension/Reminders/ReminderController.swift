//
//  ReminderController.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/16/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import Foundation
import WatchKit
import CoreData


class ReminderViewController: WKInterfaceController, NSFetchedResultsControllerDelegate {
    
  
    
    
    @IBOutlet weak var reminderTable: WKInterfaceTable!
    
    var items = [String]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        reminderTable.setNumberOfRows(items.count, withRowType: "reminderRow")
        
        for rowIndex in 0 ..< items.count {
                   set(row: rowIndex, to: items[rowIndex])
               }
        
    }
    
    @IBAction func addReminderPressed() {
        
        presentTextInputController(withSuggestions: nil, allowedInputMode: .plain) { [unowned self] (result) in
            guard let result = result?.first as? String else { return }
            
            self.reminderTable.insertRows(at: IndexSet(integer: self.items.count), withRowType: "reminderRow")
            self.set(row: self.items.count, to: result)
            self.items.append(result)
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
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    
    
}
