//
//  GameScene.swift
//  demoSpriteKit
//
//  Created by Jairo Júnior on 06/07/23.
//

import SpriteKit
import GameplayKit
import AVFoundation


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var contato:SKAction!
    private var BGM:AVAudioPlayer!

    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        contato = SKAction.playSoundFileNamed("Hit", waitForCompletion: false)
    
        func didBegin(_ contact: SKPhysicsContact) {
            self.run(contato)
        }
        
        
    
        /*
        // Cria uma constante com a caminho do arquivo de audio no projeto.
        let BGMPath = Bundle.main.url(forResource: "Hit", withExtension: "wav")
        
        // Tenta carregar o arquivo no player.
        do {
            BGM = try AVAudioPlayer(contentsOf: BGMPath!, fileTypeHint: "wav")
        }
        // Se falhar, imprime o erro no console.
        catch {
            print(error)
        }
        
        // Define quantas vezes a música deve tocar, utilize qualquer valor negativo para configurar um loop infinito.
        BGM.numberOfLoops = -1
        // Começa a tocar a música.
        BGM.play()
         */
    }
}
