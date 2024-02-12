//
//  GameScene.swift
//  GameTest
//
//  Created by Jairo Júnior on 11/02/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let currentTime: TimeInterval = TimeInterval()
    
    override func didMove(to view: SKView) {
        
      
    }
    
    func createWave() {
        if let node = self.childNode(withName: "waveShapeNode"){
            node.removeFromParent()
        }
        let wavePath = UIBezierPath()
        var amplitude: CGFloat = 50 * 2
        var numberOfPoints = 10
        let waveVelocity: CGFloat = 5 + (50 * 0.15)
        var complement: CGFloat = 0
        
       
        
        for i in 0...numberOfPoints {
            let x = CGFloat(i) * complement
            let y = amplitude * sin(CGFloat(i) + currentTime * waveVelocity)
            let point = CGPoint(x: x, y: y)
            
            if i == 0 {
                wavePath.move(to: point)
            } else {
                wavePath.addLine(to: point)
            }
        }
    
        let waveShapeNode = SKShapeNode(path: wavePath.cgPath)
        waveShapeNode.position = CGPoint(x: self.frame.minX - (waveShapeNode.frame.width/2), y: (self.frame.height / 2) - (waveShapeNode.frame.height))
        
        
        
        waveShapeNode.name = "waveShapeNode"
        
        if self.childNode(withName: "waveShapeNode") == nil{
            addChild(waveShapeNode)
        }
        
//        self.waveNode = waveShapeNode
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
