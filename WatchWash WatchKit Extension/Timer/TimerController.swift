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
    var isWorkingOut = false

    var startWash = "Start"
    var stopWash = "Stop"
    
    var intervalValue:Double = 20.0
    
    
    func startTimer(value: Bool) {
        
        isRunning = value
               if value{
                   textLabel.setText(icon())
               }else{
                   textLabel.setText(icon())

               }
               //If in a workout, reset the timer
               if isWorkingOut{
                   timerReset()
               }
        
    }
    
    
    func startRunning () {
        isWorkingOut = !isWorkingOut
        if isWorkingOut{
            //set up for workout
            textLabel.setText(icon())

            
            //start the timer
            timerReset()
        } else {
            //show pizza
            textLabel.setText(icon())
            countdownTimer.stop()
            timerStop()
        }
    }
    
    func icon() -> String {
         if isRunning{
             return startWash
      
         }else{
              
             return stopWash
         }
          
     }
    
    
    func timerReset(){
         // A method to reset timer to 0 and start timer
         let interval:TimeInterval = 5.0
        timerGroup.setBackgroundImageNamed("initial")
        timerGroup.startAnimatingWithImages(in: NSRange(location:0, length: 120), duration: interval, repeatCount: 1)
         //Control the timer control on the interface
         countdownTimer.stop()
         let time  = Date(timeIntervalSinceNow: interval)
         countdownTimer.setDate(time)
         countdownTimer.start()
          
         //control the runLoop timer
         if intervalTimer.isValid{intervalTimer.invalidate()} //shut off timer if on
        intervalTimer = Timer.scheduledTimer(timeInterval: interval ,
             target: self,  //Object to target when done
            selector: #selector(timerDidEnd(timer:)), //Method on the object
             userInfo: nil, //Extra user info, most likely a dictionary
             repeats: false) //Repeat of not
          
     }
    
    
    func timerStop(){
        intervalTimer.invalidate()
    }
    
    
     
    func startSecondTimer() {
        
                let timerValue = intervalValue
        // A method to reset timer to 0 and start timer
               let interval:TimeInterval = timerValue
               //Control the timer control on the interface
        
            timerGroup.setBackgroundImageNamed("progresscircle")
            timerGroup.startAnimatingWithImages(in: NSRange(location:0, length: 120), duration: interval, repeatCount: 1)

               countdownTimer.stop()
               let time  = Date(timeIntervalSinceNow: interval)
               countdownTimer.setDate(time)
               countdownTimer.start()
                
               //control the runLoop timer
               if intervalTimer.isValid{intervalTimer.invalidate()} //shut off timer if on
              intervalTimer = Timer.scheduledTimer(timeInterval: interval ,
                   target: self,  //Object to target when done
                selector: #selector(secondTimerDidEnd(timer:)), //Method on the object
                   userInfo: nil, //Extra user info, most likely a dictionary
                   repeats: false) //Repeat of not
    }
    
    
   
    @objc func timerDidEnd(timer:Timer){
        //When we reach end of an workout interval, switch workout type
            isRunning = !isRunning
        
         DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.startSecondTimer()
                }
        
            
        //}
    }
    
    @objc func secondTimerDidEnd(timer:Timer){
        //When we reach end of an workout interval, switch workout type
            isRunning = !isRunning
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.pushController(withName: "doneView", context: nil)
            }
        
            
        //}
    }
    
    
    
        override func awake(withContext context: Any?) {
            super.awake(withContext: context)
    
            intervalValue = context as! Double
            
            textLabel.setText(icon())
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
