//
//  ContentView.swift
//  Chat
//
//  Created by Jairo Júnior on 25/08/23.
//

import SwiftUI

struct ContentView: View {
    var model = ContentViewM()
    
    var body: some View {
        NavigationStack{
            VStack{
                CloudKitUserBootcamp()
                ListView()
                    .environment(\.managedObjectContext, model.dataController.persistentCloudKitContainer.viewContext)
                   
            }.navigationTitle("Chat")
        }
    }
}


