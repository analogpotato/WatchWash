//
//  TimerController.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/14/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import WatchKit
import Foundation
import SpriteKit

class TimerController: WKInterfaceController {


    @IBOutlet weak var countdownTimer: WKInterfaceTimer!
    @IBOutlet weak var timerLabel: WKInterfaceLabel!

    @IBOutlet weak var timerGroup: WKInterfaceGroup!
    
    
    let currentDate = Date()
    let soapArray = ["Get some soap!","Prep phase","Lather up!", "Soapy, soap, soap","Wash in 3!"]
    let sayingsArray = ["Wash those hands!", "Clean up!","Deep clean initiated", "Get under your fingernails","Water time!","Rinse, Lather, Repeat","You don't know where those hands have been"]
    var isRunning = true
    
    var timer = Timer()
    var labelText:TimeInterval?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        

        labelText = context as? TimeInterval
        let addedTime = context as? Double
        
        firstTimer()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.secondTimer()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + addedTime! + 7) {
//            self.doneButton.setHidden(false)
            self.pushController(withName: "doneView", context: nil)
        }
     }
    
    func firstTimer(){
        let interval:TimeInterval = 4.0
        
//        timerGroup.setBackgroundImageNamed("initial")
//        timerGroup.startAnimatingWithImages(in: NSRange(location:0, length: Int(interval) + 1), duration: interval, repeatCount: 1)
        
//        if let scene: SKScene = SKScene(fileNamed: "ProgressCirle.swift") {
//
//        }
        
        
        timerLabel.setText(self.soapArray.randomElement())
        
        let time = Date(timeIntervalSinceNow: interval)
        countdownTimer.setDate(time)
        countdownTimer.start()
        
        if timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(timerDidEnd(timer:)), userInfo: nil, repeats: false)
        }
    }
    
    
    func timerStop(){
           timer.invalidate()
       }
    
    @objc
    func timerDidEnd(timer:Timer) {
        isRunning = !isRunning
        firstTimer()
        
    }
    
    func secondTimer() {
        
                        self.timerLabel.setText(self.sayingsArray.randomElement())
                        guard let timeInterval = labelText else {
                            return
            
                        }
                        let myDate = Date(timeIntervalSinceNow: timeInterval + 1)
                        self.countdownTimer.setDate(myDate)
                        self.countdownTimer.start()
        
    }
    
    
}
