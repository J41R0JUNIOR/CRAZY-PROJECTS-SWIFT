//
//  View1.swift
//  Plus Time
//
//  Created by Jairo Júnior on 12/05/23.
//

import SwiftUI
 
struct View1: View {
    var numViews:Int = 10
    
    // variavel pra abrir e fechar o modal
    @State var estadoModal = false
    
    var body: some View {
        ZStack {
            Color(red:98/255, green: 84/255, blue:253/255).ignoresSafeArea()
            
            //Color(cor2).ignoresSafeArea()
            VStack{
                HStack{
                    ZStack{
                        //barra de pesquisa
                        RoundedRectangle(cornerRadius: 10).frame(width: 308, height: 36).foregroundColor(cor3)
                        HStack{
                            Image(systemName: "magnifyingglass").foregroundColor(cor2)
                            Text("Search").foregroundColor(cor2)
                            Spacer()
                        }.padding()
                    }
                    
                    Spacer()
                    
                    //abrir modal de add eventos/tarefas
                    Button {
                        estadoModal.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil").foregroundColor(cor3)
                    }
                    .sheet(isPresented: $estadoModal) {
                        ModalView(estadoModal: $estadoModal)
                    }
                    
                }.padding()
                //Cor de fundo da ScrollView
                ZStack{
                    RoundedRectangle(cornerRadius: 15).foregroundColor(dark).frame(width: 385)
                    
                    //ScrollView dos horários
                    ScrollView {
                        ForEach (0..<numViews, id: \.self){ numero in
                            HStack{
                                Button {
                                    
                                    print("Foi")
                                } label: {
                                    Image(systemName:
                                            "bell.fill").font(.system(size: 20)).foregroundColor(.red)
                                }

                                
                                
                                VStack{
                                    HStack{
                                        Text(TdsEstructs[0].title).fontWeight(.bold).foregroundColor(.white).lineLimit(1)
                                            .allowsTightening(false)
                                        Spacer()
                                        
                                    }
                                    HStack{
                                        Text(TdsEstructs[0].body).font(.system(size: 15)).foregroundColor(cor3).lineLimit(2)
                                            .allowsTightening(false)
                                        Spacer()
                                        Text("20/02 >").fontWeight(.bold).foregroundColor(cor3)
                                        
                                    }
                                    Divider().background(cor3)
                                }
                            }.padding()
                            //Divider().background(Color.white)
                            
                        }
                    }
                }
            }.padding()
        }
    }
}

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
