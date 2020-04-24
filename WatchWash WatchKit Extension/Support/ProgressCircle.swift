//
//  ProgressCirle.swift
//  WatchWash WatchKit Extension
//
//  Created by Frank Foster on 4/23/20.
//  Copyright © 2020 Frank Foster. All rights reserved.
//

import Foundation
import WatchKit
import SpriteKit


class RestScene: SKScene {

    var timerDuration: TimeInterval = 3.0

    override func sceneDidLoad() {


        addCircle()
    }


    func addCircle() {

        let path = getCirclePath(ofRadius: 50, withPercent: 1)

        let shapeNode = SKShapeNode(path: path)
        shapeNode.strokeColor = .blue
        shapeNode.fillColor = .clear
        shapeNode.lineWidth = 4
        shapeNode.lineCap = .round
        shapeNode.position = CGPoint(x: 0, y: 0)
        shapeNode.zRotation =  CGFloat.pi * 0.5

        self.addChild(shapeNode)


        animateStrokeEnd(circle: shapeNode, duration: 5){
            shapeNode.path = nil
            print("Done")
        }
    }

    func getCirclePath(ofRadius radius :CGFloat, withPercent percent:CGFloat) -> CGPath {
       return  UIBezierPath(arcCenter: .zero,
                     radius: radius,
                     startAngle: 0,
                     endAngle: 2 * .pi * percent,
                     clockwise: true).cgPath



    }

    func animateStrokeEnd(circle:SKShapeNode, duration:TimeInterval, completion:@escaping ()->Void)  {
        guard let path = circle.path else {
            return
        }
        let radius = path.boundingBox.width/2
        let animationAction = SKAction.customAction(withDuration: duration) { (node, elpasedTime) in
            let percent =  elpasedTime/CGFloat(duration)
            (node as! SKShapeNode).path = self.getCirclePath(ofRadius: radius, withPercent: 1 - percent)
        }

        circle.run(animationAction) {
            completion()
        }


    }

}
