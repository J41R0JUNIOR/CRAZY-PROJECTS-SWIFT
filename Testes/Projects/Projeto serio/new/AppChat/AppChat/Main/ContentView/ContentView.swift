//
//  ContentView.swift
//  AppChat
//
//  Created by Jairo Júnior on 05/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = PushNotificationCloudKitViewModel()

    @State var msg: String = ""
    @Environment(\.modelContext) var context
    var body: some View {
        VStack {
            HStack{
                Button("Request"){
                    vm.requestNotificationPermission()
                }
                .buttonStyle(.borderedProminent)
                Button("Subscribe"){
                    vm.subscribeToNotifications()
                }
                .buttonStyle(.borderedProminent)
                Button("Ubsubscribe"){
                    vm.unSubscribeToNotifications()
                }
                .buttonStyle(.borderedProminent)
            }
            ListView()
            TextField("Text a message", text: $msg)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    if msg != ""{
                        let message = Message(text: msg)
                        context.insert(message)
                        msg = ""
                    }
                }
        }.padding()
    }
}

#Preview {
    ContentView(msg: "")
}
