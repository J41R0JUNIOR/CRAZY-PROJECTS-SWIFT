//
//  EditPersonagemView.swift
//  TestCD001
//
//  Created by Jairo Júnior on 15/08/23.
//

import SwiftUI

struct EditPersonagemView: View {
    @Environment (\.managedObjectContext) var ManagedObjectContext
    @Environment (\.dismiss) var dismiss
    @State private var nome = ""
    @State private var peso:Double = 0
    @State private var idade:Int16 = 18
    
    var personagem:FetchedResults<Personagem>.Element
    
    
    var body: some View {
        Form{
            Section{
                TextField("\(personagem.nome!)", text: $nome)
                    .onAppear{
                        nome = personagem.nome!
                        peso = personagem.peso
                        idade = personagem.idade
                    }
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
                        
                        DataController().editPersonagem(character: personagem, nome: nome, peso: peso, idade: idade, context: ManagedObjectContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

