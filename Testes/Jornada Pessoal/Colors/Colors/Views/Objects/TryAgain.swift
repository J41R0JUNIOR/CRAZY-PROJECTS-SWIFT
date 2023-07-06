//
//  TryAgain.swift
//  Colors
//
//  Created by Jairo Júnior on 05/07/23.
//

import SwiftUI

struct TryAgain: View {
    @Binding var tentativas:Int
    @Binding var maiorPontuacao:Int
    @Binding var pontos:Int
    
    
    var body: some View {
        VStack{
            Text("Maior Pontuação: \(maiorPontuacao)")
            Button {
                tentativas = 0
                maiorPontuacao = 0
                pontos = 0
            } label: {
                Text("Tentar novamente")
            }

        }
    }
}

