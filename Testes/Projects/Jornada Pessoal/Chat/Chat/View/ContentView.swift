//
//  ContentView.swift
//  Chat
//
//  Created by Jairo Júnior on 25/08/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dataController = DataController()

    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var Mensagem: FetchedResults<Msg>
    
    @StateObject private var vm = CloudKitUserBootcampViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Text("Logged in: \(vm.userName)")
                ListView()
                    .environment(\.managedObjectContext, dataController.persistentCloudKitContainer.viewContext)
            }.navigationTitle("Chat")
        }
    }
}


