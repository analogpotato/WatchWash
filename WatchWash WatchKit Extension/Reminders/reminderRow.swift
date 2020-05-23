//
//  reminderRow.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/16/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import WatchKit

class reminderRow: NSObject {

    @IBOutlet weak var reminderLabel: WKInterfaceLabel!
    
    @IBOutlet weak var deleteButton: WKInterfaceButton!
    
    
    @IBAction func pressDelete() {
        print("delete")
    }
    
    
}
