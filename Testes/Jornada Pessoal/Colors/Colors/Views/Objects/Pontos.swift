//
//  Pontos.swift
//  Colors
//
//  Created by Jairo Júnior on 05/07/23.
//

import SwiftUI

struct Pontos: View {
    
    @Binding var pontos:Int
    @Binding var inicio:Int
    @Binding var tentativas:Int
    
    var body: some View {
        HStack{
            Spacer()
            Text("Restantes: \((tentativas - 3) * -1)")
        }
        VStack{
            if inicio == 1{
                Text("\(mostrar(pontos: pontos))")
            }
            if pontos > 0{
                Text("Pontos: \(pontos)")
            }
        }
    }
}


func calcular(red:Double, green:Double, blue:Double, redSlider:Double, greenSlider:Double, blueSlider:Double) -> Int{
    
    var contador:Double = 0
    var pontos:Double = 0
    
    
    
    if((redSlider - red) <= 0.1000000000000050 && (redSlider - red) >= -0.1000000000000050){
        print("vermelho foi")
        contador += 1
    }
    if((greenSlider - green) <= 0.1000000000000050 && (greenSlider - green) >= -0.1000000000000050){
        print("verde foi")
        contador += 1
    }
    if((blueSlider - blue) <= 0.1000000000000050 && (blueSlider - blue) >= -0.1000000000000050){
        print("azul foi")
        contador += 1
    }
    
    
    
    if contador == 3{
        var vermelhoDif:Double = redSlider - red
        var verdeDif:Double = greenSlider - green
        var azulDif:Double = blueSlider - blue
        print("Voce acertou cor!!!")
        if vermelhoDif < 0{
            vermelhoDif = vermelhoDif * (-1)
        }
        if verdeDif < 0{
            verdeDif = verdeDif * (-1)
        }
        if azulDif < 0{
            azulDif = azulDif * (-1)
        }
        
        let diferenca: Double = vermelhoDif + verdeDif + azulDif
        pontos = 10 / diferenca
        
        if pontos >= 500{
            print("Voce e fera de mais")
        }

        print("Diferenca ", diferenca)
        print("Pontos ", Int(pontos))
        
    }else{
        print("Voce errou a cor!!!")
    }
    return Int(pontos)
    
}

func mostrar(pontos:Int) -> String{
    
    if pontos > 500{
        return "Pontuação Extraordinária!!!"
    }
    if pontos > 200{
        return "Excelente, você chegou muito perto!!!"
    }
    if pontos > 0{
        return "Parabéns, você acertou a cor!!!"
    }
    return "Nada ainda"
}
