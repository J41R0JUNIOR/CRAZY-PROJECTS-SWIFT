//
//  SkButton.swift
//  TestGame01
//
//  Created by Jairo Júnior on 09/07/23.
//
import SpriteKit
import Foundation


class SkButtonNode:  SKNode {
    var image:SKSpriteNode? = SKSpriteNode(imageNamed: "bolinha")
    var label:SKLabelNode? = SKLabelNode()
    var action: (() ->Void)?
    
    init(action: @escaping () -> Void) {
        
        self.action = action
        super.init()
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.action?()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action?()
    }
    
}
