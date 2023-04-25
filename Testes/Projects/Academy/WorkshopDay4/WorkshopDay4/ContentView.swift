//
//  ContentView.swift
//  WorkshopDay4
//
//  Created by Jairo Júnior on 19/04/23.
//

import SwiftUI

struct ContentView: View {
    //aqui variáveis
    
    @State var contador: Int = 0
    @State var abrirModal = false
    @State var texto: String = " "
  
    //fim variáveis
    var body: some View {
        VStack {
            Spacer()
            
            Text("Texto vai estar aqui \"\(texto)\"").foregroundColor(.gray)
            
        Button {
            abrirModal.toggle()
        }label: {
            Text("Abrir Modal")
        }
        .padding()
        .sheet(isPresented: $abrirModal){
            ModalView(abrirModal: $abrirModal, digitado: $texto)
        }
        .buttonStyle(.borderedProminent).accentColor(.black)
        }
    }
}
 
struct ModalView: View{
    @Binding var abrirModal:Bool
    @Binding var digitado: String
    var body: some View{
        VStack{
            Text("Digite o Texto aqui")
            TextField("Digite o Texto", text: $digitado).textFieldStyle(.roundedBorder).multilineTextAlignment(.center)
            
            Button("Fechar Modal"){
                abrirModal.toggle()
            }.buttonStyle(.borderedProminent).accentColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
