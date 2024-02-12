//
//  Objec.swift
//  TestPhysics
//
//  Created by Jairo Júnior on 16/01/24.
//

import Foundation
import SpriteKit

class Object: SKSpriteNode{
    var skin: SKTexture
    var sizee: CGSize
    
    var mass: Float
    
    init(skin: SKTexture, size: CGSize, mass: Float) {
        self.skin = skin
        self.sizee = size
        self.mass = mass
        
        super.init(texture: skin, color: .red, size: sizee)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }  
}
