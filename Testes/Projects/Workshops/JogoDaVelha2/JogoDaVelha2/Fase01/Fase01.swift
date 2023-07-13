//
//  Fase01.swift
//  JogoDaVelha2
//
//  Created by Filipe Lopes on 12/07/23.
//

import SpriteKit

class Fase01 : SKScene {
    private let camadaVisual = CamadaVisual()
    private let camadaLogica = CamadaLogica()
    
    override func didMove(to view: SKView) {
        
        camadaLogica.camadaVisual = camadaVisual
        camadaVisual.camadaLogica = camadaLogica
        
        for child in self.children {
            if let label = child as? SKLabelNode {
                camadaVisual.pegarLabel(node: label)
            } else if let sprite = child as? SKSpriteNode {
                camadaVisual.pegarSprite(node: sprite)
            }
        }
        self.addChild(camadaVisual)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
    }
}
