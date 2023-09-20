//
//  ContentView.swift
//  TestCD001
//
//  Created by Jairo Júnior on 15/08/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.dataAdd, order: .reverse)]) var character: FetchedResults<Personagem>
    
    
    @State private var showingAddView = false
    
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                List{
                    ForEach(character) { character in
                        NavigationLink(destination: EditPersonagemView( personagem: character)){
                            HStack{
                                VStack(alignment: .leading, spacing: 6){
                                    Text(character.nome!).bold()
                                    Text("\(Int(character.idade)) anos")
                                    Text("\(Float(character.peso), specifier: "%.2f") Kg")
                                }
                                Spacer()
                                Text("ID:  \(character.id!)").foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: deletarPer)
                }
                .listStyle(.plain)
            }
            .navigationTitle("iTeste")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showingAddView.toggle()
                    }label: {
                        Label("Add Personagem", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddPersonagemView()
            }
        }
        .navigationViewStyle(.stack)
    }
    private func deletarPer(offsets: IndexSet){
        //pass
        withAnimation {
            offsets.map{character[$0]}.forEach(managedObjContext.delete)
            
            DataController().saveData(context: managedObjContext)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
