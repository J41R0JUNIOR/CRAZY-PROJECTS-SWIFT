//
//  Character.swift
//  TestGame01Pro
//
//  Created by Jairo Júnior on 14/07/23.
//

import Foundation
import SpriteKit

class Character: SKNode {
    var character: SKSpriteNode?
    
    override init() {
        super.init()
        
        character = SKSpriteNode(texture: SKTexture(imageNamed: "player"), size: CGSize(width: 200, height: 210))
        
        
        if let character = character {
            addChild(character)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
