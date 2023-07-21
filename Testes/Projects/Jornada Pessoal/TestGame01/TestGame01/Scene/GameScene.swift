//
//  GameScene.swift
//  TestGame01
//
//  Created by Jairo Júnior on 06/07/23.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
  
    var character: SKSpriteNode!
    
    var moveLeftButton: SkButtonNode!
    var moveRightButton: SkButtonNode!
    var jumpButton: SkButtonNode!

    var isMovingLeft = false
    var isMovingRight = false
    var cameraNode: SKCameraNode!
    
    var heroFrames = [SKTexture]()
    var textureAtlaas = SKTextureAtlas(named: "walk")

    
    
    
    
    override func didMove(to view: SKView) {
        
        
        
        createMoveButtons()
        cameraNode = SKCameraNode()
        self.camera = cameraNode
        addChild(cameraNode)
        
        character = childNode(withName: "player") as? SKSpriteNode
        for i in 0..<textureAtlaas.textureNames.count {
            let textureNames = "hero" + String(i)
            heroFrames.append(textureAtlaas.textureNamed(textureNames))
        }
    }
    
    
    
    func createMoveButtons() {
        jumpButton = SkButtonNode(image: SKSpriteNode(imageNamed: "botao"), label: SKLabelNode())
        addChild(jumpButton)
        
        moveLeftButton = SkButtonNode(image: .init(color: .blue, size: CGSize(width: 100, height: 100)), label: .init(text: "Left"))
        addChild(moveLeftButton)
        
        moveRightButton = SkButtonNode(image: .init(color: .blue, size: CGSize(width: 100, height: 100)), label: .init(text: "Right"))
        addChild(moveRightButton)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if moveLeftButton.contains(touchLocation) {
            isMovingLeft = true
            character.run(SKAction.repeatForever(SKAction.animate(with: heroFrames, timePerFrame: 0.1)))
            character.xScale = -1
        } else if moveRightButton.contains(touchLocation) {
            isMovingRight = true
            character.run(SKAction.repeatForever(SKAction.animate(with: heroFrames, timePerFrame: 0.1)))
            character.xScale = 1
        } else if jumpButton.contains(touchLocation) { 
            jumpCharacter()
        }
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if moveLeftButton.contains(touchLocation) {
            isMovingLeft = false
            character.removeAllActions()
            character.texture = SKTexture(imageNamed: "player")
        } else if moveRightButton.contains(touchLocation) {
            isMovingRight = false
            character.removeAllActions()
            character.texture = SKTexture(imageNamed: "player")
        }

    }
    
    
    
    func jumpCharacter() {
        character.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 1000))
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        let characterSpeed: CGFloat = 5.0
        
        if isMovingLeft {
            character.position.x -= characterSpeed
        } else if isMovingRight {
            character.position.x += characterSpeed
        }
        
        if let camera = cameraNode {
                camera.position = character.position
        }
        
        moveLeftButton.position.x = character.position.x - 900
        moveLeftButton.position.y = character.position.y - 300
        moveRightButton.position.x = character.position.x - 700
        moveRightButton.position.y = character.position.y - 300
        jumpButton.position.x = character.position.x  + 900
        jumpButton.position.y = character.position.y - 300
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if !moveLeftButton.contains(touchLocation) {
            isMovingLeft = false
            character.removeAllActions()
        }
        
        if !moveRightButton.contains(touchLocation) {
            isMovingRight = false
            character.removeAllActions()
        }
    }
}

