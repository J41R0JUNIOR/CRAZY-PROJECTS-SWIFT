//
//  Estado.swift
//  JogoDaVelha2
//
//  Created by Filipe Lopes on 12/07/23.
//

import Foundation

enum Estado {
    case X
    case O
    case Nenhum
    
    func pegarContrario() -> Estado {
        switch self {
        case .O, .Nenhum:
            return .X
        case .X:
            return .O
        }
    }
}
