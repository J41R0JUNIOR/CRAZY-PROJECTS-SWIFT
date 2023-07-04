//
//  Bottons.swift
//  Colors
//
//  Created by Jairo Júnior on 04/07/23.
//

import SwiftUI

struct Bottons: View {
    
    @Binding var redSlider:Double
    @Binding var greenSlider:Double
    @Binding var blueSlider:Double
    
    @Binding var red:Double
    @Binding var green:Double
    @Binding var blue:Double
    
    
    
    var body: some View {
        Button {
            
            
            print(red, green, blue)
            
            red = Double.random(in: 0...1)
            green = Double.random(in: 0...1)
            blue = Double.random(in: 0...1)
            
        } label: {
            Text("Randomizar")
        }.buttonStyle(.borderedProminent)
        
        Button{
            calcular(red: red, green: green, blue: blue, redSlider:redSlider, greenSlider:greenSlider, blueSlider:blueSlider)
        } label: {
            Text("Tentativa")
        }.buttonStyle(.borderedProminent)
         
    }
}

func calcular(red:Double, green:Double, blue:Double, redSlider:Double, greenSlider:Double, blueSlider:Double){
    
    var contador:Int = 0
    var pontos:Double = 0
    
    if redSlider == red && greenSlider == green && blueSlider == blue{
        print("Acertou na mosca!!!")
        pontos = 1000
        print("Pontos = ",pontos)
        return;
        
    }else{
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
    }
    
    if contador == 3{
        print("Voce chegou perto da cor!!!")
        
    }else{
        print("Voce errou a cor!!!")
    }
    
}
