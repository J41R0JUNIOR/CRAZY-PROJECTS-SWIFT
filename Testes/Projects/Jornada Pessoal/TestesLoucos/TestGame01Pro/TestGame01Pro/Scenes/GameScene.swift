//
//  GameScene.swift
//  TestGame01Pro
//
//  Created by Jairo Júnior on 14/07/23.
//
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var cameraNode: SKCameraNode!
    
    
    override func didMove(to view: SKView) {
        cameraNode = SKCameraNode()
        self.camera = cameraNode
        addChild(cameraNode)

        
        let character1 = Character()
        addChild(character1)
        character1.position = CGPoint.zero
//        character1.character?.texture = SKTexture(imageNamed: "player")
        
        
        
        let jump = SkButtonNode(image: .init(color: .blue, size: CGSize(width: 100, height: 100)), label: .init(text: "UP"))
        addChild(jump)
        jump.position = CGPoint(x: 200, y: 20)
        //jump.label?.fontSize = 400
        
        
    }
}

