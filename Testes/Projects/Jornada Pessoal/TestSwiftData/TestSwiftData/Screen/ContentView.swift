//
//  ContentView.swift
//  TestSwiftData
//
//  Created by Jairo Júnior on 24/10/23.
//

import SwiftUI
import SwiftData

struct DataModel {
    @Query private var items: [DataItem]
}

struct ContentView: View {
    @Environment(\.modelContext) var context
    var dataModel = DataModel()
    
    var body: some View {
        VStack {
            Text("Tap this button")
            Button("Add item"){
                addItem()
            }.navigationTitle("testando")
            
            
            ListView()
            
        }
    }
    
    func addItem(){
        //create the item
        let item = DataItem(nome: "Teste")
        //add item to data contex
        context.insert(item)
    }
    
    
    
    
}

#Preview {
    ContentView()
}
