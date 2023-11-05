//
//  ListView.swift
//  AppChat
//
//  Created by Jairo Júnior on 05/11/23.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Query var messages: [Message]
    @Environment(\.colorScheme) var isDarkMode
    @Environment(\.modelContext) var context


    var body: some View {
        NavigationStack{
            VStack{
                Text("opa")
                List{
                    ForEach(messages)  { mensagem in
                        HStack{
                            Text(mensagem.text )
                                .foregroundColor(isDarkMode == .dark ? .white : .black)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet{
                            deleteItem(messages[index])
                        }
                    })
                }
                .listStyle(.plain)
            }
            .navigationTitle("AppChat")
        }
    }
    
    
    func deleteItem(_ message: Message){
        context.delete(message)
    }
}

#Preview {
    ListView()
}
