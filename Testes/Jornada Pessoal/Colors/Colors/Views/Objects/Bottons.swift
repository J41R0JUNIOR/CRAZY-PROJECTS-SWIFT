//
//  Bottons.swift
//  Colors
//
//  Created by Jairo Júnior on 04/07/23.
//

import SwiftUI
import AVFoundation

struct Bottons: View {
    
    @Binding var redSlider:Double
    @Binding var greenSlider:Double
    @Binding var blueSlider:Double
    
    @Binding var red:Double
    @Binding var green:Double
    @Binding var blue:Double
    
    @Binding var score:Int
    @Binding var inicio:Int
    @Binding var pontos:Int
    @Binding var tentativas:Int
    @Binding var maiorPontuacao:Int
    
    var body: some View {
        Button {
            
            
            print(red, green, blue)
            
            red = Double.random(in: 0...1)
            green = Double.random(in: 0...1)
            blue = Double.random(in: 0...1)
            inicio = 1
        } label: {
            Text("Randomizar")
        }.buttonStyle(.borderedProminent)
        
        if inicio == 1{
            Button{
                
                 pontos = calcular(red: red, green: green, blue: blue, redSlider:redSlider, greenSlider:greenSlider, blueSlider:blueSlider)
                
                if score < pontos{
                    score = pontos
                    UserDefaults.standard.set(score, forKey: "Data")
                }
                
                if(maiorPontuacao < pontos) && (tentativas != 4){
                    maiorPontuacao = pontos
                    print("maior")
                }
                
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
                
                tentativas += 1
                
                
                if tentativas == 4{
                    red = Double.random(in: 0...1)
                    green = Double.random(in: 0...1)
                    blue = Double.random(in: 0...1)
                    
                }
            } label: {
                if tentativas == 3{
                    Text("Concluir")
                }else{
                    Text("Tentativa")
                }
            }.buttonStyle(.borderedProminent)
        }
    }
}

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}

func randomizar(){
    
}
