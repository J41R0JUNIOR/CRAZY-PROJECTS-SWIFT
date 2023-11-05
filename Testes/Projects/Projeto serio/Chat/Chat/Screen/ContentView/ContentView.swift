//
//  ContentView.swift
//  Chat
//
//  Created by Jairo Júnior on 25/08/23.
//

import SwiftUI

struct ContentView: View {
    var model = ContentViewM()
    @StateObject var cloudKit = CloudKitUserBootcampViewModel()
    @Environment(\.modelContext) var context
    @State var msg:String = ""
    @Environment(\.colorScheme) var isDarkMode
    @FocusState var focus:Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                CloudKitUserBootcamp()
                ListView().modelContainer(for: [Msg.self])
                
                HStack{
                    TextField("Mensagem", text: $msg)
                        .foregroundColor(isDarkMode == .dark ? .white : .black)
                        .focused($focus)
                        .onSubmit {
                            if msg != ""{
                                let msg = Msg(mensagem: msg, user: cloudKit.userName)
                                context.insert(msg)
                            }
                            
                        }
                        .gesture(TapGesture().onEnded { _ in
                            focus = false
                        })
                }.padding()
            }.navigationTitle("Chat")
        }
    }
}


