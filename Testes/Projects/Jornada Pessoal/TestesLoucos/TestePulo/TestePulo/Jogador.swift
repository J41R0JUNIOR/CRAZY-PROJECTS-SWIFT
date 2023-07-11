//
//  Player.swift
//  TestGame01
//
//  Created by Jairo Júnior on 10/07/23.
//

import UIKit
import SpriteKit
import GameplayKit

class PlayerNode:SKSpriteNode{
    
    private var player: SKSpriteNode?
    
    func sceneDidLoad() {
        do {
            player = SKSpriteNode(imageNamed: "player")
            
            let body = SKPhysicsBody(rectangleOf: player?.size ?? .zero)
            body.affectedByGravity = true
            body.allowsRotation = false
            
            player?.physicsBody = body
            
            if let playerNode = player{
                self.addChild(playerNode)
            }
            
            do {
                let ground = SKSpriteNode(color: .brown, size: .init(width: 500, height: 100))
                ground.position.y -= 200
                
                
                let body = SKPhysicsBody(rectangleOf: ground.size)
                body.affectedByGravity = true
                body.allowsRotation = false
                body.isDynamic = false
                
                ground.physicsBody = body
                
                self.addChild(ground)
                
            }
        }
        
        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
            player?.physicsBody?.applyImpulse(.init(dx: 30, dy: 30))
        }
    }
}

