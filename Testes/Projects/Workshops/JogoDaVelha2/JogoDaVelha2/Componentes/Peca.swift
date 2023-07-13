//
//  Peca.swift
//  JogoDaVelha2
//
//  Created by Filipe Lopes on 12/07/23.
//

import SpriteKit

let xTexture: SKTexture = SKTexture(imageNamed: "X")
let oTexture: SKTexture = SKTexture(imageNamed: "O")

class Peca: SKNode {
    private var sprite = SKSpriteNode()
    var estado: Estado = .Nenhum
    var camadaLogica : PecaDelegate?
    
    init(node: SKSpriteNode) {
        super.init()
        self.sprite = node
        self.sprite.removeFromParent()
        self.addChild(self.sprite)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func atualizarSprite(state: Estado){
        switch state{
        case .X:
            self.sprite.texture = xTexture
        case .O:
            self.sprite.texture = oTexture
        case .Nenhum:
            self.sprite.texture = SKTexture()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let estado = camadaLogica?.pegarEstado() {
            self.atualizarSprite(state: estado)
            self.camadaLogica?.checarSeacabou()
        }
    }
    
    
}
