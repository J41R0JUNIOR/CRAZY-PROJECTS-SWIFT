//
//  GameScene.swift
//  TestGame02
//
//  Created by Jairo Júnior on 11/07/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var character = SKSpriteNode()
    var touchLocation = CGPoint()
    var isMoving = false
    
    override func didMove(to view: SKView) {
        character = self.childNode(withName: "player") as! SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if touchLocation.x < character.position.x {
            character.physicsBody?.applyImpulse(.init(dx: -100, dy:  300))
        }
        if touchLocation.x > character.position.x {
            character.physicsBody?.applyImpulse(.init(dx: 100, dy:  300))
        }
        
        
        
    }
}
