//
//  GameScene.swift
//  TestPhysics
//
//  Created by Jairo Júnior on 14/01/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var squareNode: SKSpriteNode = SKSpriteNode(imageNamed: "square")
    let cameraNode = SKCameraNode()
    var ground: SKSpriteNode = SKSpriteNode()
    
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .clear
        self.addChild(cameraNode)
        cameraNode.position = CGPoint(x: 0, y: 0)
        cameraNode.setScale(1.0)
        self.camera = cameraNode
        
        
    }
    
    func applyPhysics(){
        
    }
   
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
       
    }
}
