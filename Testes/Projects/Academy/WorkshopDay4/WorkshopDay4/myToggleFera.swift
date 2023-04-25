//
//  myToggleFera.swift
//  WorkshopDay4
//
//  Created by Jairo Júnior on 19/04/23.
//

import SwiftUI

struct myToggleFera: View {
    @State var estaLigado = true
    @State var valorSlider = 20.0
    var body: some View {
        VStack{
            if(estaLigado == true){
                Circle().frame(width: valorSlider, height: 100).foregroundColor(.blue)
            }else if(estaLigado == false){
                Circle().frame(width: valorSlider, height: 100).foregroundColor(.red)
            }
            HStack{
                Toggle(isOn: $estaLigado){
                    Text("Mudar Cor")
                        .foregroundColor(.blue)
                    
                }
            }
            Slider(value: $valorSlider, in: 20...100)
        }.padding()
    }
    
    struct myToggleFera_Previews: PreviewProvider {
        static var previews: some View {
            myToggleFera()
        }
    }
}

