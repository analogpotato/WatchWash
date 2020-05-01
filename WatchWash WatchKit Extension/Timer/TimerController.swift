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
    @IBOutlet weak var textLabel: WKInterfaceLabel!
    @IBOutlet weak var timerGroup: WKInterfaceGroup!
    
    
    var intervalTimer = Timer()
    var isRunning = true
    var isWashing = false
    var intervalValue:Double = 20.0
    var startWash = "Start"
    var stopWash = "Stop"
    
    let defaults = UserDefaults.standard
    let soapArray = ["Get some soap!","Prep phase","Lather up!", "Soapy, soap","Wash in 3!"]
    let sayingsArray = ["Wash those hands!", "Clean up!","","Water time!","Rinse, Repeat!"]

    func setTimer() {
        let timerValue = defaults.object(forKey: "Timer") as? Double
        intervalValue = timerValue!
        
    }
    
    
    func startTimer(value: Bool) {
        isRunning = value
        if value{
            setLabel()
        }else{
            setLabel()
        }
        if isWashing {
            timerReset()
        }
    }
    
    
    func startRunning () {
        isWashing = !isWashing
        if isWashing{
            setLabel()
            timerReset()
        } else {
            setLabel()
            countdownTimer.stop()
            timerStop()
        }
    }
    
    
    func setLabel() {
        textLabel.setText(soapArray.randomElement())
    }
    
    func setSecondLabel() {
        textLabel.setText(sayingsArray.randomElement())
    }
    
    
    func timerReset(){
        
        let interval:TimeInterval = 4.0
        
        countdownTimer.stop()
        let time  = Date(timeIntervalSinceNow: interval)
        countdownTimer.setDate(time)
        countdownTimer.start()
        
        
        if intervalTimer.isValid{intervalTimer.invalidate()}
        intervalTimer = Timer.scheduledTimer(timeInterval: interval ,
                                             target: self,
                                             selector: #selector(timerDidEnd(timer:)),
                                             userInfo: nil,
                                             repeats: false)
    }
    
    
    func timerStop(){
        intervalTimer.invalidate()
    }
    
    
    func startSecondTimer() {
        setSecondLabel()
        
        let timerValue = intervalValue + 1
        let interval:TimeInterval = timerValue
        
        
        timerGroup.setBackgroundImageNamed("progresscircle")
        timerGroup.startAnimatingWithImages(in: NSRange(location:0, length: 120), duration: interval, repeatCount: 1)
        
        countdownTimer.stop()
        let time  = Date(timeIntervalSinceNow: interval)
        countdownTimer.setDate(time)
        countdownTimer.start()
        
        
        if intervalTimer.isValid{intervalTimer.invalidate()}
        intervalTimer = Timer.scheduledTimer(timeInterval: interval ,
                                             target: self,
                                             selector: #selector(secondTimerDidEnd(timer:)),
                                             userInfo: nil,
                                             repeats: false)
    }
    
    
    @objc func timerDidEnd(timer:Timer){
        
        isRunning = !isRunning
        timerGroup.stopAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            self.startSecondTimer()
            
        }
        
    }
    
    @objc func secondTimerDidEnd(timer:Timer){
        
        isRunning = !isRunning
        timerGroup.stopAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.pushController(withName: "doneView", context: nil)
        }
        
        
    }
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        setTimer()
        setLabel()
        startRunning()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    let currentDate = Date()
    //    let soapArray = ["Get some soap!","Prep phase","Lather up!", "Soapy, soap","Wash in 3!"]
    //    let sayingsArray = ["Wash those hands!", "Clean up!","","Water time!","Rinse, Repeat!"]
    //
    //    var isRunning = true
    //    var timer = Timer()
    //    var labelText:TimeInterval?
    //
    //    override func awake(withContext context: Any?) {
    //        super.awake(withContext: context)
    //
    //
    //        labelText = context as? TimeInterval
    //        let addedTime = context as? Double
    //
    //        firstTimer()
    //
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    //
    //            self.secondTimer()
    //        }
    //
    //        DispatchQueue.main.asyncAfter(deadline: .now() + addedTime! + 7) {
    //            self.pushController(withName: "doneView", context: nil)
    //        }
    //     }
    //
    //    func firstTimer(){
    //
    //        let interval:TimeInterval = 4.0
    //
    //        timerGroup.setBackgroundImageNamed("initial")
    //        timerGroup.startAnimatingWithImages(in: NSRange(location:0, length: 120), duration: interval, repeatCount: 1)
    //
    //        textLabel.setText(self.soapArray.randomElement())
    //
    //        let time = Date(timeIntervalSinceNow: interval)
    //        countdownTimer.setDate(time)
    //        countdownTimer.start()
    //
    //        if timer.isValid {
    //            print("isvalid")
    //            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(timerDidEnd(timer:)), userInfo: nil, repeats: false)
    //        }
    //    }
    //
    //    func secondTimer() {
    //
    //        timerStop()
    //
    //        let interval = Double(labelText!)
    //
    //        timerGroup.setBackgroundImageNamed("progresscircle")
    //        timerGroup.startAnimatingWithImages(in: NSRange(location:0, length: 120), duration: interval, repeatCount: 1)
    //
    //        self.textLabel.setText(self.sayingsArray.randomElement())
    //        guard let timeInterval = labelText else {
    //            return
    //        }
    //
    //        let myDate = Date(timeIntervalSinceNow: timeInterval + 1)
    //        self.countdownTimer.setDate(myDate)
    //        self.countdownTimer.start()
    //    }
    //
    //    func timerStop(){
    //           timer.invalidate()
    //       }
    //
    //    @objc
    //    func timerDidEnd(timer:Timer) {
    //        isRunning = !isRunning
    //        firstTimer()
    //    }
}
