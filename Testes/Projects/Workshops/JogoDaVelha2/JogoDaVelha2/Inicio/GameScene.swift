
import SpriteKit
import GameplayKit

class GameScene: SKScene {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let fase01 = SKScene(fileNamed: "Fase01")
        self.view?.presentScene(fase01)
    }
    
}
