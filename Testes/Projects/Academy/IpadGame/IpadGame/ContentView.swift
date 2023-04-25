//
//  ContentView.swift
//  IpadGame
//
//  Created by Jairo Júnior on 24/04/23.
//
import SwiftUI


struct ContentView: View {
    @State var redSlider = 0.0
    @State var greenSlider = 0.0
    @State var blueSlider = 0.0
    @State var cor1 = Color(red: 0, green: 0, blue: 0)
    
    @State var red:Double = 0
    @State var green:Double = 0
    @State var blue:Double = 0
    
    @State var cor2 = Color(red: 0, green: 0, blue: 0)
    
    
    var body: some View {
        
        VStack {
            HStack{
                Rectangle().frame(width: 400, height: 400).foregroundStyle(Color(red:red, green: green, blue:blue))
                
                Rectangle().frame(width: 400, height: 400).foregroundStyle(Color(red: redSlider, green: greenSlider, blue: blueSlider))
                
            }.padding()
            
            Slider(value: $redSlider, in: 0...1).tint(.red).padding()
            
            Slider(value: $greenSlider, in: 0...1).tint(.green).padding()
            
            Slider(value: $blueSlider, in: 0...1).padding()
                
            Button {
                print(cor1)
                print(red, green, blue)
                
                red = Double.random(in: 0...1)
                green = Double.random(in: 0...1)
                blue = Double.random(in: 0...1)
                cor1 = Color(red: red, green: green, blue: blue)
            } label: {
                Text("Randomizar")
            }.buttonStyle(.borderedProminent)
            Button{
                
            } label: {
                Text("Pontuação")
            }.buttonStyle(.borderedProminent)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

