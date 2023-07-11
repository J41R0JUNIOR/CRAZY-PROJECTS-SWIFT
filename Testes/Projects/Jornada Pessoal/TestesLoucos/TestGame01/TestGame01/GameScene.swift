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
    
    override func didMove(to view: SKView) {
        super.sceneDidLoad()
        
        let image = SKSpriteNode(imageNamed: "Image 1")
        let label = SKLabelNode()
        
        
        let button = SkButtonNode(image: image, label: label) {
            print("Pressionou o botão")
        }
        self.addChild(button)
        
    }
    
    
}
*/

class GameScene: SKScene {
    
    private var player: SKSpriteNode?
    
    override func sceneDidLoad() {
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
                //ground.position.y -= 200
                
                
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


/*
class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    
}
*/

/*
class GameScene: SKScene {
    
    var character = SKSpriteNode()
    var touchLocation = CGPoint()
    var isMoving = false
    
    override func didMove(to view: SKView) {
        character = self.childNode(withName: "player") as! SKSpriteNode
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        /*
         for touch in touches {
         touchLocation = touch.location(in: self)
         character.position.x = touchLocation.x
         isMoving = true
         }
         */
        if let location = touches.first?.location(in: self){
            let direction : CGFloat = location.x < 0 ? -1 : 1
            character.physicsBody?.applyImpulse(.init(dx: direction * 1000, dy: direction * 2000))
        }
    }
}
*/

class GameScene: SKScene {
    
    var character = SKSpriteNode()
    var touchLocation = CGPoint()
    var isMoving = false
    
    override func didMove(to view: SKView) {
        character = self.childNode(withName: "player") as! SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        if let location = touches.first?.location(in: self){
            let direction : CGFloat = location.x < 0 ? -1 : 1
            character.physicsBody?.applyImpulse(.init(dx: direction * 100, dy:  200))
            character.xScale = direction
        }
    }
}
