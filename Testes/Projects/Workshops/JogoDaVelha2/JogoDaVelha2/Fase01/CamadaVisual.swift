//
//  camadaVisual.swift
//  JogoDaVelha2
//
//  Created by Filipe Lopes on 12/07/23.
//

import SpriteKit

class CamadaVisual: SKNode {
    
    weak var camadaLogica: CamadaLogica?
    var botaoRecomecar = SKSpriteNode()
    var labelPontuacaoX = SKLabelNode()
    var labelPontuacaoO = SKLabelNode()
    
    func pegarLabel(node: SKLabelNode) {
        switch node.name {
        case "pontuacaoX":
            self.labelPontuacaoX = node
        case "pontuacaoO":
            self.labelPontuacaoO = node
        default:
            print("Opa, \(node.name ?? "node sem nome") não me importa")
        }
    }
    
    func atualizarPontos(pontuacao: Pontuacao){
        labelPontuacaoX.text = "X:\(pontuacao.pontuacaoX)"
        labelPontuacaoO.text = "O:\(pontuacao.pontuacaoO)"
    }
    
    func pegarSprite(node: SKSpriteNode) {
        guard let camadaLogica = camadaLogica else {
            return
        }
        switch node.name {
        case "botaoRecomecar":
            self.botaoRecomecar = node
            botaoRecomecar.isHidden = true
        case "peca":
            let peca = Peca(node: node)
            peca.camadaLogica = camadaLogica
            self.addChild(peca)
            peca.atualizarSprite(state: camadaLogica.estadoDoJogo)
        default:
            print("Opa, \(node.name ?? "node sem nome") não me importa")
        }
    }
}
