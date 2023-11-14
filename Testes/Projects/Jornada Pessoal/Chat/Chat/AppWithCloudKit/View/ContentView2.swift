//
//  ContentView2.swift
//  Chat
//
//  Created by Jairo Júnior on 09/11/23.
//

import SwiftUI
import CloudKit


struct ContentView2: View {
    @StateObject var vm = CloudKitSettings()
    @StateObject var not = PushNotificationCloudKit()
    
    var body: some View {
        VStack{
            HStack{
                HStack{
//                    Button("Request"){
//                        not.requestNotificationPermission()
//                    }
//                    .buttonStyle(.borderedProminent)
//                    Button("Subscribe"){
//                        not.subscribeToNotifications()
//                    }
//                    .buttonStyle(.borderedProminent)
//                    Button("Ubsubscribe"){
//                        not.unSubscribeToNotifications()
//                    }
//                    .buttonStyle(.borderedProminent)
                }
            }
            Divider()
            List{
                ForEach(vm.messages, id: \.self){item in
                    Text(item.text)
                        .onTapGesture {
                            vm.updateItem(message: item)
                        }
                }.onDelete(perform:vm.deleteItem)
            }.listStyle(.plain)
            Divider()
            Spacer()
            TextField("Add message", text: $vm.text)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    vm.addItem()
                    vm.text = ""
            }
        }.padding()
        
    }
}

#Preview {
    ContentView2()
}
