//
//  GameViewController.swift
//  TestePulo
//
//  Created by Jairo Júnior on 10/07/23.
//

import UIKit
import SpriteKit
import GameplayKit


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}



class JumpPlayer:GameScene{
    
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
