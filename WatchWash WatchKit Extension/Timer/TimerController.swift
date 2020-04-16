//
//  TimerController.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/14/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import WatchKit
import Foundation

class TimerController: WKInterfaceController {


    @IBOutlet weak var countdownTimer: WKInterfaceTimer!
    @IBOutlet weak var timerLabel: WKInterfaceLabel!
    @IBOutlet weak var doneButton: WKInterfaceButton!
    
    
    let currentDate = Date()
    let soapArray = ["Get some soap!","Prep phase","Lather up!", "Soapy, soap, soap","Wash in 3!"]
    let sayingsArray = ["Wash those hands!", "Clean up!","Deep clean initiated", "Get under your fingernails","Water time!","Rinse, Lather, Repeat","You don't know where those hands have been"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        doneButton.setHidden(true)
        
        firstTimer()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if let label = context as? Int {
                self.timerLabel.setText(self.sayingsArray.randomElement())
                let timeInterval = Double(label)
                let myDate = Date(timeIntervalSinceNow: timeInterval + 1)
                self.countdownTimer.setDate(myDate)
                self.countdownTimer.start()
                
               
            }
            
        }
        // Configure interface objects here.
    }
    
    func firstTimer(){
        timerLabel.setText(soapArray.randomElement())
        let firstCounter = 4.0
        let firstDate = Date(timeInterval: firstCounter, since: currentDate)
        countdownTimer.setDate(firstDate)
        countdownTimer.start()
        print(firstDate)
    }
}
