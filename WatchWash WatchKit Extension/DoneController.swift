//
//  DoneController.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/23/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import WatchKit
import Foundation


class DoneController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.pushController(withName: "mainView", context: nil)
        }
        
        
        // Configure interface objects here.
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
