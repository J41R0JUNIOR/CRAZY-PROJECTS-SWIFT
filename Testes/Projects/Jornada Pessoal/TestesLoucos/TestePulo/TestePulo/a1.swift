
import SpriteKit
import GameplayKit

/*
class GameScene: SKScene {
    
    var character = SKSpriteNode()
    var touchLocation = CGPoint()
    var isMoving = false
    
    override func didMove(to view: SKView) {
        character = self.childNode(withName: "player") as! SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        for touch in touches {
            touchLocation = touch.location(in: self)
            character.position.x = touchLocation.x
            character.physicsBody?.applyImpulse(.init(dx: 30, dy: 30))
            isMoving = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            touchLocation = touch.location(in: self)
            character.position.x = touchLocation.x
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isMoving = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isMoving {
                    andar()
                } else {
                    character.removeAllActions()
                }
    }
    func andar(){
//        if let walkAnimation = self.childNode(withName: "walkAnimation")?.action(forKey: "walkAnimation") as? SKAction {
//            let repeatAction = SKAction.repeatForever(walkAnimation)
//            character.run(repeatAction, withKey: "walking")
//        } else {
//            print("Unable to retrieve animation action")
//        }
    }
    
}
*/
