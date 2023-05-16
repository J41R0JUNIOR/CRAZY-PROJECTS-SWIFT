//
//  View1.swift
//  Plus Time
//
//  Created by Jairo Júnior on 12/05/23.
//

import SwiftUI
 
struct MainView: View {
    
    
    // variavel pra abrir e fechar o modal
    @State var estadoModal1 = false
    @State var title = "Nothing"
    
    var body: some View {
        ZStack {
            Color(red:98/255, green: 84/255, blue:253/255).ignoresSafeArea()
            
            VStack{
                //Parte superior da tela
                
                HStack{
                    //barra de pesquisa
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).frame(width: 308, height: 36).foregroundColor(cor3)
                        HStack{
                            //pesquisa
                            Button {
                                print("lupa de pesquisa")
                            
                            } label: {
                                Image(systemName: "magnifyingglass").foregroundColor(cor2)
                                Text("Search").foregroundColor(cor2)
                            }

                            Spacer()
                        }.padding()
                    }
                    Spacer()
                    
                    //abrir modal de add eventos/tarefas
                    Button {
                        estadoModal1.toggle()
                        
                    } label: {
                        Image(systemName: "square.and.pencil").foregroundColor(cor3)
                    }
                    .sheet(isPresented: $estadoModal1) {
                        ModalView(estadoModal1: $estadoModal1)
                    }
                    
                }.padding()
                //Cor de fundo da ScrollView
                ZStack{
                    RoundedRectangle(cornerRadius: 15).foregroundColor(dark).frame(width: 385)
                    
                    
                    
                    
                    
                    
                    //ScrollView dos horários
                    ScrollView {
                        ForEach (tdsStructs.indices, id: \.self){index in
                            
                            HStack{
                                
                                //botao do sino
                                Button {
                                    print("Sininho fora Modal")
                                    
                                    tdsStructs[index].bell.toggle()
                                    print(tdsStructs[index].bell)
                                } label: {
                                    Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(.red)
                                    
                                    
                                }
                                //Entrar na estrutura
                                Button {
                                    print("Entrar na estrutura")
                                } label: {
                                    //corpo da estrutura
                                    VStack{
                                        HStack{
                                            Text(tdsStructs[index].title).fontWeight(.bold).foregroundColor(.white).lineLimit(1)
                                                .allowsTightening(false)
                                            Spacer()
                                            
                                        }
                                        HStack{
                                            Text(tdsStructs[index].body).font(.system(size: 15)).foregroundColor(cor3).lineLimit(2)
                                                .allowsTightening(false)
                                            Spacer()
                                            Text("00/00 >").fontWeight(.bold).foregroundColor(cor3)
                                            
                                        }
                                        Divider().background(cor3)
                                    }
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
