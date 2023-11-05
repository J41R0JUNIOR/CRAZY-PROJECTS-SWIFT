//
//  ContentView.swift
//  AppChat
//
//  Created by Jairo Júnior on 05/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var msg: String = ""
    @Environment(\.modelContext) var context
    var body: some View {
        VStack {
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
        }
    }
}

#Preview {
    ContentView(msg: "")
}
