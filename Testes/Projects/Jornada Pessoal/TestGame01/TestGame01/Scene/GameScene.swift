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

        
        ///
        ///
        ///
        ///

        
 
        
        
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
    
    
    
    
    func createLine(pointA: CGPoint, pointB: CGPoint) -> SKShapeNode {
        let pathToDraw = CGMutablePath()
        pathToDraw.move(to: pointA)
        pathToDraw.addLine(to: pointB)
        let line = SKShapeNode()
        line.path = pathToDraw
        line.glowWidth = 1
        line.strokeColor = .white
        return line
    }
    
    func genrateLightningPath(startingFrom: CGPoint, angle: CGFloat, isBranch: Bool) -> [SKShapeNode] {
        var strikePath: [SKShapeNode] = []
        var startPoint = startingFrom
        var endPoint = startPoint
        let numberOfLines = isBranch ? 50 : 120
        
        var idx = 0
        while idx < numberOfLines {
            strikePath.append(createLine(pointA: startPoint, pointB: endPoint))
            startPoint = endPoint
            let r = CGFloat(10)
            endPoint.y -= r * cos(angle) + CGFloat.random(in: -10 ... 10)
            endPoint.x += r * sin(angle) + CGFloat.random(in: -10 ... 10)
            
            if Int.random(in: 0 ... 100) == 1 {
                let branchingStartPoint = endPoint
                
                let branchingAngle = CGFloat.random(in: -CGFloat.pi / 4 ... CGFloat.pi / 4) // the angle to make the branching look natural
                
                strikePath.append(contentsOf: genrateLightningPath(startingFrom: branchingStartPoint, angle: branchingAngle, isBranch: true))
            }
            idx += 1
        }
        return strikePath
    }
    
    func lightningStrike(throughPath: [SKShapeNode], maxFlickeringTimes: Int) {
       
        let fadeTime = TimeInterval(CGFloat.random(in: 0.005 ... 0.03))
        let waitAction = SKAction.wait(forDuration: 0.05)
        let reduceAlphaAction = SKAction.fadeAlpha(to: 0.0, duration: fadeTime)
        let increaseAlphaAction = SKAction.fadeAlpha(to: 1.0, duration: fadeTime)
        let flickerSeq = [waitAction, reduceAlphaAction, increaseAlphaAction]
        
        var seq: [SKAction] = []
        let numberOfFlashes = Int.random(in: 1 ... maxFlickeringTimes)
        
        for _ in 1 ... numberOfFlashes {
            seq.append(contentsOf: flickerSeq)
        }
        for line in throughPath {
            seq.append(SKAction.fadeAlpha(to: 0, duration: 0.25))
            seq.append(SKAction.removeFromParent())
            line.run(SKAction.sequence(seq))
            self.addChild(line)
        }
    }
    
    
    
    func flashTheScreen(nTimes: Int) {
        let lightUpScreenAction = SKAction.run { self.backgroundColor = UIColor.gray }
        let waitAction = SKAction.wait(forDuration: 0.05)
        let dimScreenAction = SKAction.run { self.backgroundColor = .darkGray}
        
        var flashActionSeq: [SKAction] = []
        for _ in 1 ... nTimes + 1 {
            flashActionSeq.append(contentsOf: [lightUpScreenAction, waitAction, dimScreenAction, waitAction])
        }
        self.run(SKAction.sequence(flashActionSeq))
    }
    
    
    ///
    ///
    ///
    ///
    ///
    
    func createMoveButtons() {
        jumpButton = SkButtonNode(image: SKSpriteNode(imageNamed: "botao"), label: SKLabelNode())
        addChild(jumpButton)
        
        moveLeftButton = SkButtonNode(image: .init(color: .blue, size: CGSize(width: 100, height: 100)), label: .init(text: "Left"))
        addChild(moveLeftButton)
        
        moveRightButton = SkButtonNode(image: .init(color: .blue, size: CGSize(width: 100, height: 100)), label: .init(text: "Right"))
        addChild(moveRightButton)
    }
    
    func jumpCharacter() {
        character.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 1000))
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let random = Int.random(in: -700 ... 700)
        
        let path = genrateLightningPath(startingFrom: CGPoint(x: character.position.x + CGFloat(random), y: character.position.y + 300), angle: CGFloat(100), isBranch: true )
        lightningStrike(throughPath: path, maxFlickeringTimes: 3)
        
        
        flashTheScreen(nTimes: 4)
        
        
        
        
        
        
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

var speed = 0
