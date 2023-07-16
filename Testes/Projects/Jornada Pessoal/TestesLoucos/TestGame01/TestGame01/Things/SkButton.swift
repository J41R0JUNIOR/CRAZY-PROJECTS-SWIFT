import SpriteKit
import Foundation

class SkButtonNode:  SKNode {
    var image:SKSpriteNode?
    var label:SKLabelNode?
    
    
    init(image:SKSpriteNode?, label:SKLabelNode?) {
        self.image = image
        self.label = label
        
        super.init()
//        self.isUserInteractionEnabled = true
        
        if let image = image {
            image.size = CGSize(width: 150, height: 150)
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
