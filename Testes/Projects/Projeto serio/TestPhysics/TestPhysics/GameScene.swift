//
//  GameScene.swift
//  TestPhysics
//
//  Created by Jairo Júnior on 14/01/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene{
    var squareNode: SKSpriteNode = SKSpriteNode(imageNamed: "square")
    let cameraNode = SKCameraNode()
    var ground: SKSpriteNode = SKSpriteNode()
    
    var objectsScene : [Object] = [
//         Object(skin: .init(imageNamed: "object"), size: .init(width: 50, height: 50), mass: 2),
         Object(skin: .init(imageNamed: "object"), size: .init(width: 50, height: 50), mass: 1)
    ]
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .clear
        self.addChild(cameraNode)
        cameraNode.position = CGPoint(x: 0, y: 0)
        cameraNode.setScale(1.0)
        self.camera = cameraNode

        ground.size = CGSize(width: view.bounds.width, height: view.bounds.height * 0.02)
        ground.position = CGPoint(x: .zero, y: -((view.bounds.height / 2) - (ground.size.height) - (view.bounds.height * 0.1)))
        
        ground.color = .red
        addChild(ground)
        
        for n in objectsScene{
            n.position = CGPoint(x: 0, y: 0)
            addChild(n)
        }
        
    }
    
    func applyPhysics(object: Object, n: Int){
        var force = CGFloat(object.mass * 9.8)
        
        if object.position.y == ground.position.y{
            force = 0
        }
        
        object.position.y -= force
    }
   
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        for (n, objectFound) in self.children.enumerated(){
            if let enviar = objectFound as? Object{
                applyPhysics(object: enviar , n: n)
            }
        }
    }
}
