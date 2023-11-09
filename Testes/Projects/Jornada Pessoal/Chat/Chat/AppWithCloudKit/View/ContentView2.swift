//
//  ContentView2.swift
//  Chat
//
//  Created by Jairo Júnior on 09/11/23.
//

import SwiftUI
import CloudKit


struct ContentView2: View {
    @StateObject var vm = viewModel()
    @StateObject var not = PushNotificationCloudKit()
    
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Button("Request"){
                        not.requestNotificationPermission()
                    }
                    .buttonStyle(.borderedProminent)
                    Button("Subscribe"){
                        not.subscribeToNotifications()
                    }
                    .buttonStyle(.borderedProminent)
                    Button("Ubsubscribe"){
                        not.unSubscribeToNotifications()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            Spacer()
            TextField("Add message", text: $vm.text)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    vm.addItem()
                    vm.text = ""
                }
            List{
                ForEach(vm.messages, id: \.self){
                    Text($0)
                }
            }.listStyle(.automatic)
        }
        
    }
}

#Preview {
    ContentView2()
}
