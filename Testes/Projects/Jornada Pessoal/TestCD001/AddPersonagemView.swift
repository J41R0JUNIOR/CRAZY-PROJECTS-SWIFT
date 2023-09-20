//
//  SwiftUIView.swift
//  TestCD001
//
//  Created by Jairo Júnior on 15/08/23.
//

import SwiftUI

struct AddPersonagemView: View {
    @Environment (\.managedObjectContext) var ManagedObjectContext
    @Environment (\.dismiss) var dismiss
    @State private var nome = ""
    @State private var peso:Double = 0
    @State private var idade:Int16 = 18
    
    var body: some View {
        Form{
            Section{
                TextField("Nome do personagem", text: $nome)
                
                VStack{
                    TextField("Peso do Personagem", value: $peso, format: .number)
                }.keyboardType(.decimalPad)
                
                VStack{
                    Stepper("Idade ", value: $idade)
                    TextField("Idade do Personagem", value: $idade, format: .number)
                                    
                }.keyboardType(.decimalPad)
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        
                        DataController().addPersonagem(nome: nome, peso: peso, idade: idade, dataAdd: Date(), context: ManagedObjectContext)
                        dismiss()
                        
                    }
                    Spacer()
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonagemView()
    }
}
