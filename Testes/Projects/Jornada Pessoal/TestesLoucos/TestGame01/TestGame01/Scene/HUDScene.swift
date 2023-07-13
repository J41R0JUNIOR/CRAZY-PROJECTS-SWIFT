//
//  HUD.swift
//  TestGame01
//
//  Created by Jairo Júnior on 13/07/23.
//

import Foundation
import SpriteKit

class HUDScene: SKScene{
    override func didMove(to view: SKView) {
        let scoreLabel = SKLabelNode(fontNamed: "Arial")
        scoreLabel.text = "Pontuação : 0"
        scoreLabel.fontSize = 50
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(scoreLabel)
    }
}
