//
//  GameScene.swift
//  TestGame01
//
//  Created by Jairo Júnior on 06/07/23.
//

import SpriteKit
import GameplayKit


/*
class GameScene: SKScene {
    var character: SKSpriteNode!
    var moveLeftButton: SKSpriteNode!
    var moveRightButton: SKSpriteNode!
    var jumpButton: SKSpriteNode!
    var doubleJumpButton: SKSpriteNode!
    var isMovingLeft = false
    var isMovingRight = false
    
    
    override func didMove(to view: SKView) {
        createMoveButtons()
        
        character = childNode(withName: "player") as? SKSpriteNode
    }
    
    func createMoveButtons() {
        
        //jumpButton = childNode(withName: "botao") as? SKSpriteNode
        //print("\(jumpButton)")
        
        
        jumpButton = SKSpriteNode(color: .gray, size: CGSize(width: 150, height: 150))
        jumpButton.position = CGPoint(x: 1000, y: 10)
        
        let jumpButtonlabel = SKLabelNode(text: "^")
        jumpButtonlabel.fontColor = .white
        jumpButtonlabel.fontSize = 20
        jumpButtonlabel.position = CGPoint.zero
        jumpButton.addChild(jumpButtonlabel)
        
        addChild(jumpButton)
        ///
        ///
        
        ///
        ///
        moveLeftButton = SKSpriteNode(color: .gray, size: CGSize(width: 150, height: 150))
        moveLeftButton.position = CGPoint(x: -1000, y: 10)
        
        let moveLeftLabel = SKLabelNode(text: "<-")
        moveLeftLabel.fontColor = .white
        moveLeftLabel.fontSize = 20
        moveLeftLabel.position = CGPoint.zero
        moveLeftButton.addChild(moveLeftLabel)
        
        addChild(moveLeftButton)
        ///
        ///
        moveRightButton = SKSpriteNode(color: .gray, size: CGSize(width: 150, height: 150))
        moveRightButton.position = CGPoint(x: -800, y: 10)
        
        let moveRightLabel = SKLabelNode(text: "->")
        moveRightLabel.fontColor = .white
        moveRightLabel.fontSize = 20
        moveRightLabel.position = CGPoint.zero
        moveRightButton.addChild(moveRightLabel)
        
        addChild(moveRightButton)
        ///
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if moveLeftButton.contains(touchLocation) {
            isMovingLeft = true
            character.xScale = -1
        } else if moveRightButton.contains(touchLocation) {
            isMovingRight = true
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
        } else if moveRightButton.contains(touchLocation) {
            isMovingRight = false
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
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if !moveLeftButton.contains(touchLocation) {
            isMovingLeft = false
        }
        
        if !moveRightButton.contains(touchLocation) {
            isMovingRight = false
        }
    }

}
*/


class GameScene: SKScene {
    var character: SKSpriteNode!
    var moveLeftButton: SKSpriteNode!
    var moveRightButton: SKSpriteNode!
    var jumpButton: SKSpriteNode!
    var doubleJumpButton: SKSpriteNode!
    var isMovingLeft = false
    var isMovingRight = false
    var cameraNode: SKCameraNode!
    
    
    override func didMove(to view: SKView) {
        createMoveButtons()
        
        character = childNode(withName: "player") as? SKSpriteNode
        cameraNode = SKCameraNode()
        self.camera = cameraNode
        addChild(cameraNode)
    }
    
    func createMoveButtons() {
        
        //jumpButton = childNode(withName: "botao") as? SKSpriteNode
        //print("\(jumpButton)")
        
        
        jumpButton = SKSpriteNode(color: .gray, size: CGSize(width: 150, height: 150))
        jumpButton.position = CGPoint(x: 1000, y: 10)
        
        let jumpButtonlabel = SKLabelNode(text: "^")
        jumpButtonlabel.fontColor = .white
        jumpButtonlabel.fontSize = 20
        jumpButtonlabel.position = CGPoint.zero
        jumpButton.addChild(jumpButtonlabel)
        
        addChild(jumpButton)
        ///
        ///
        
        ///
        ///
        moveLeftButton = SKSpriteNode(color: .gray, size: CGSize(width: 150, height: 150))
        moveLeftButton.position = CGPoint(x: -1000, y: 10)
        
        let moveLeftLabel = SKLabelNode(text: "<-")
        moveLeftLabel.fontColor = .white
        moveLeftLabel.fontSize = 20
        moveLeftLabel.position = CGPoint.zero
        moveLeftButton.addChild(moveLeftLabel)
        
        addChild(moveLeftButton)
        ///
        ///
        moveRightButton = SKSpriteNode(color: .gray, size: CGSize(width: 150, height: 150))
        moveRightButton.position = CGPoint(x: -800, y: 10)
        
        let moveRightLabel = SKLabelNode(text: "->")
        moveRightLabel.fontColor = .white
        moveRightLabel.fontSize = 20
        moveRightLabel.position = CGPoint.zero
        moveRightButton.addChild(moveRightLabel)
        
        addChild(moveRightButton)
        ///
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if moveLeftButton.contains(touchLocation) {
            isMovingLeft = true
            character.xScale = -1
        } else if moveRightButton.contains(touchLocation) {
            isMovingRight = true
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
        } else if moveRightButton.contains(touchLocation) {
            isMovingRight = false
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
                
        // Atualize a posição dos botões de movimento para seguir o personagem
        moveLeftButton.position.x = character.position.x - 900
        moveRightButton.position.x = character.position.x - 700
        jumpButton.position.x = character.position.x  + 900
        moveLeftButton.position.y = character.position.y - 300
        moveRightButton.position.y = character.position.y - 300
        jumpButton.position.y = character.position.y - 300
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if !moveLeftButton.contains(touchLocation) {
            isMovingLeft = false
        }
        
        if !moveRightButton.contains(touchLocation) {
            isMovingRight = false
        }
    }

}


/*
class GameScene: SKScene {
    var character: SKSpriteNode!
    var moveLeftButton: SKSpriteNode!
    var moveRightButton: SKSpriteNode!
    var jumpButton: SKSpriteNode!
    var doubleJumpButton: SKSpriteNode!
    var isMovingLeft = false
    var isMovingRight = false
    var cameraNode: SKCameraNode!
    
    
    override func didMove(to view: SKView) {
        createMoveButtons()
        
        character = childNode(withName: "player") as? SKSpriteNode
        cameraNode = SKCameraNode()
        self.camera = cameraNode
        character.addChild(cameraNode)
    }
    
    func createMoveButtons() {
        
        //jumpButton = childNode(withName: "botao") as? SKSpriteNode
        //print("\(jumpButton)")
        
        
        jumpButton = SKSpriteNode(color: .gray, size: CGSize(width: 150, height: 150))
        jumpButton.position = CGPoint(x: 1000, y: 10)
        
        let jumpButtonlabel = SKLabelNode(text: "^")
        jumpButtonlabel.fontColor = .white
        jumpButtonlabel.fontSize = 20
        jumpButtonlabel.position = CGPoint.zero
        jumpButton.addChild(jumpButtonlabel)
        
        addChild(jumpButton)
        ///
        ///
        
        ///
        ///
        moveLeftButton = SKSpriteNode(color: .gray, size: CGSize(width: 150, height: 150))
        moveLeftButton.position = CGPoint(x: -1000, y: 10)
        
        let moveLeftLabel = SKLabelNode(text: "<-")
        moveLeftLabel.fontColor = .white
        moveLeftLabel.fontSize = 20
        moveLeftLabel.position = CGPoint.zero
        moveLeftButton.addChild(moveLeftLabel)
        
        addChild(moveLeftButton)
        ///
        ///
        moveRightButton = SKSpriteNode(color: .gray, size: CGSize(width: 150, height: 150))
        moveRightButton.position = CGPoint(x: -800, y: 10)
        
        let moveRightLabel = SKLabelNode(text: "->")
        moveRightLabel.fontColor = .white
        moveRightLabel.fontSize = 20
        moveRightLabel.position = CGPoint.zero
        moveRightButton.addChild(moveRightLabel)
        
        addChild(moveRightButton)
        ///
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if moveLeftButton.contains(touchLocation) {
            isMovingLeft = true
            character.xScale = -1
        } else if moveRightButton.contains(touchLocation) {
            isMovingRight = true
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
        } else if moveRightButton.contains(touchLocation) {
            isMovingRight = false
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
        
       
                
        // Atualize a posição dos botões de movimento para seguir o personagem
        moveLeftButton.position.x = character.position.x - 900
        moveRightButton.position.x = character.position.x - 700
        jumpButton.position.x = character.position.x  + 900
        moveLeftButton.position.y = character.position.y - 300
        moveRightButton.position.y = character.position.y - 300
        jumpButton.position.y = character.position.y - 300
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        let touchLocation = touch.location(in: self)
        
        if !moveLeftButton.contains(touchLocation) {
            isMovingLeft = false
        }
        
        if !moveRightButton.contains(touchLocation) {
            isMovingRight = false
        }
    }

}
*/
