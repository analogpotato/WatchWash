////
////  SecondTimerController.swift
////  WatchWash WatchKit Extension
////
////  Created by Frank Foster on 4/30/20.
////  Copyright © 2020 Frank Foster. All rights reserved.
////
//
//import WatchKit
//import Foundation
//
//
//class SecondTimerController: WKInterfaceController {
//
//    @IBOutlet weak var secondTimerGroup: WKInterfaceGroup!
//    @IBOutlet weak var countdownTimer: WKInterfaceTimer!
//    @IBOutlet weak var textLabel: WKInterfaceLabel!
//    
//    let initialVC = TimerController()
//    
//    var intervalTimer = Timer()
//    var isRunning = true
//    var isWashing = false
//
//    var startWash = "Start"
//    var stopWash = "Stop"
//    
//    let defaults = UserDefaults.standard
//    
//    var intervalValue:Double = 20.0
//    
//    func startSecondTimer() {
//        
//                let timerValue = intervalValue
//        // A method to reset timer to 0 and start timer
//               let interval:TimeInterval = timerValue
//               //Control the timer control on the interface
//        
//            secondTimerGroup.setBackgroundImageNamed("progresscircle")
//            secondTimerGroup.startAnimatingWithImages(in: NSRange(location:0, length: 120), duration: interval, repeatCount: 1)
//
//               countdownTimer.stop()
//               let time  = Date(timeIntervalSinceNow: interval)
//               countdownTimer.setDate(time)
//               countdownTimer.start()
//                
//               //control the runLoop timer
//               if intervalTimer.isValid{intervalTimer.invalidate()} //shut off timer if on
//              intervalTimer = Timer.scheduledTimer(timeInterval: interval ,
//                   target: self,  //Object to target when done
//                selector: #selector(secondTimerDidEnd(timer:)), //Method on the object
//                   userInfo: nil, //Extra user info, most likely a dictionary
//                   repeats: false) //Repeat of not
//    }
//    
//    
//        @objc func secondTimerDidEnd(timer:Timer){
//            //When we reach end of an workout interval, switch workout type
//                isRunning = !isRunning
//            secondTimerGroup.stopAnimating()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//    //            self.timerGroup.stopAnimating()
//                self.pushController(withName: "doneView", context: nil)
//                }
//            
//                
//            //}
//        }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    override func awake(withContext context: Any?) {
//        super.awake(withContext: context)
//        
//        intervalValue = defaults.object(forKey: "Timer") as? Double ?? 20.0
//        textLabel.setText("Washing Now")
//        startSecondTimer()
//        
//        // Configure interface objects here.
//    }
//
//    override func willActivate() {
//        // This method is called when watch view controller is about to be visible to user
//        super.willActivate()
//    }
//
//    override func didDeactivate() {
//        // This method is called when watch view controller is no longer visible
//        super.didDeactivate()
//    }
//
//}
