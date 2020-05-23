//
//  ReminderDetailView.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 5/23/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import WatchKit
import Foundation


class ReminderDetailView: WKInterfaceController {

    
    @IBOutlet weak var timeText: WKInterfaceLabel!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let text = context as? String
        
        timeText.setText(text)

    }
    
    
    @IBAction func deleteButtonPressed() {
        //TODO: Create delete function here, need to identify how to delete from the row that way
    }
    
    override func willActivate() {

        super.willActivate()
    }

    override func didDeactivate() {

        super.didDeactivate()
    }

}
