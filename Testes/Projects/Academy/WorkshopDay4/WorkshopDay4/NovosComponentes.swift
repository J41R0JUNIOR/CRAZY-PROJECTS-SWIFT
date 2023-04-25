//
//  NovosComponentes.swift
//  WorkshopDay4
//
//  Created by Jairo Júnior on 19/04/23.
//

import SwiftUI

struct NovosComponentes: View {
    
    @State var estaLigado = true
    @State var valorSlider = 1.0
    
    var body: some View {
        VStack{
            Toggle(isOn: $estaLigado){
                Text("Meu Toggle")
                    .foregroundColor(.blue)
            }
            Slider(value: $valorSlider, in: 0...10)
                .padding()
            Text("\(valorSlider)")
        }.padding()
    }
}

struct NovosComponentes_Previews: PreviewProvider {
    static var previews: some View {
        NovosComponentes()
    }
}
