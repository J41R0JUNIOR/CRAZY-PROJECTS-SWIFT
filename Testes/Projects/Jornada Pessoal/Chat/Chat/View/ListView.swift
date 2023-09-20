//
//  ListView.swift
//  Chat
//
//  Created by Jairo Júnior on 31/08/23.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var Mensagem: FetchedResults<Msg>
    @Environment (\.dismiss) var dismiss
    @FocusState var focus:Bool

    @Environment(\.colorScheme) var isDarkMode


    @State var msg:String = ""


    var body: some View {
        VStack{

            List{
                ForEach(Mensagem)  { mensagem in
                    Text(mensagem.mensagem!)
                        .foregroundColor(isDarkMode == .dark ? .white : .black)
                }
                .onDelete(perform: deletarMsg)
//                .listRowBackground(isDarkMode == .dark ? Color.accentColor : Color.gray)
            }
            .listStyle(.automatic)
//            .scrollContentBackground(.hidden)
            HStack{
                TextField("Mensagem", text: $msg)
                    .foregroundColor(isDarkMode == .dark ? .white : .black)
                    .focused($focus)
                
                
                    .onSubmit {
                        if msg != ""{
                            DataController().addMensagem(mensagem: msg, context: managedObjContext)
                            msg = ""
                            dismiss()
                        }
                    }
                    .gesture(TapGesture().onEnded { _ in
                        focus = false
                    })
            }.padding()
        }

    }
    private func deletarMsg(offsets: IndexSet){
        //pass
        withAnimation {
            offsets.map{Mensagem[$0]}.forEach(managedObjContext.delete)

            DataController().saveData(context: managedObjContext)
        }
    }
}


//import SwiftUI
//struct ListView: View {
//    @Environment(\.managedObjectContext) var managedObjContext
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.date)]) var Mensagem: FetchedResults<Msg>
//    @Environment(\.colorScheme) var isDarkMode
//
//    @State var msg: String = ""
//    @StateObject var dataController = DataController() // Initialize your data controller
//
//    var body: some View {
//        List {
//            ForEach(Mensagem) { mensagem in
//                VStack(alignment: .leading, spacing: 6) {
//                    Text(mensagem.mensagem ?? "aa")
//                }
//            }
//
//        }
//        TextField("Mensagem", text: $msg)
//            .onSubmit {
//                dataController.addMensagem(mensagem: msg, data: Date(), context: managedObjContext)
//                msg = "" // Clear the text field after submission
//            }
//    }
//}

