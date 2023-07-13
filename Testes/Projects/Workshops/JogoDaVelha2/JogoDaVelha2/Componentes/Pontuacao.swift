//
//  Pontuacao.swift
//  JogoDaVelha2
//
//  Created by Filipe Lopes on 12/07/23.
//

import Foundation

class Pontuacao{
    var pontuacaoX: Int {
        get {
            UserDefaults.standard.integer(forKey: "pontuacaoX")
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "pontuacaoX")
        }
    }
    
    var pontuacaoO: Int {
        get {
            UserDefaults.standard.integer(forKey: "pontuacaoO")
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "pontuacaoO")
        }
    }
}
