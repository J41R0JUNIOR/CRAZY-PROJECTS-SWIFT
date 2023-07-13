//
//  Protocolos.swift
//  JogoDaVelha2
//
//  Created by Filipe Lopes on 12/07/23.
//

import Foundation

protocol PecaDelegate {
    func pegarEstado() -> Estado
    func checarSeacabou()
}
