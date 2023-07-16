import SpriteKit
import Foundation

class SkButtonNode:  SKNode {
    var image:SKSpriteNode?
    var label:SKLabelNode?
    
    
    init(image:SKSpriteNode?, label:SKLabelNode?) {
        self.image = image
        self.label = label
        
        super.init()
        self.isUserInteractionEnabled = true
        
        if let image = image {
            image.size = CGSize(width: 50, height: 50)
            addChild(image)
        }
                
        if let label = label {
            label.fontSize = 25
            label.position = CGPoint(x: 0, y: -10)
            image?.addChild(label)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}


/*
 class Button: SKNode {
     var button: SKSpriteNode?
     var label: SKLabelNode?
     
     override init() {
         super.init()
         
         button = SKSpriteNode(color: .gray, size: CGSize(width: 150, height: 150))
         label = SKLabelNode()
         
         
          
         
         label = SKLabelNode(text: "ola")
         label?.fontColor = .white
         label?.fontSize = 50
         label?.position = CGPoint.zero
         
         if let button = button {
             addChild(button)
         }
         if let label = label {
             button?.addChild(label)
         }
     }
     
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
 }

 */
