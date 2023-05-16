//
//  View1.swift
//  Plus Time
//
//  Created by Jairo Júnior on 12/05/23.
//

import SwiftUI
 
struct View1: View {
    
    
    // variavel pra abrir e fechar o modal
    @State var estadoModal1 = false
    
    
    
    @State var bell = [false]
    @State var titulo = [" "]
    
    
    var body: some View {
        ZStack {
            Color(red:98/255, green: 84/255, blue:253/255).ignoresSafeArea()
            
            //Color(cor2).ignoresSafeArea()
            VStack{
                HStack{
                    //barra de pesquisa
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).frame(width: 308, height: 36).foregroundColor(cor3)
                        HStack{
                            Button {
                                print("teste")
                            
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
                        
                        numViews+=1
                        
                        bell.append(false)
                        print(bell[1])
                        
                        TdsStructs.append(allStructures(title: "Titulo", body: "Texto", bell: View1().$bell[View1().$bell.count - 1], text: $titulo[View1().titulo.count - 1]))
                        
                    } label: {
                        Image(systemName: "square.and.pencil").foregroundColor(cor3)
                    }
                    .sheet(isPresented: $estadoModal1) {
                        ModalView(estadoModal1: $estadoModal1, bell: $bell[bell.count-1], text: $titulo[titulo.count-1])
                    }
                    
                }.padding()
                //Cor de fundo da ScrollView
                ZStack{
                    RoundedRectangle(cornerRadius: 15).foregroundColor(dark).frame(width: 385)
                    
                    //ScrollView dos horários
                    ScrollView {
                        ForEach (0..<numViews, id: \.self){numero in
                            HStack{
                                //botao do sino
                                Button {
                                    print("Sininho fora Modal")
                                    print(numero)
                                    bell[numero].toggle()
                                    
                                } label: {
                                    if(bell[numero] == false){
                                        Image(systemName:
                                                "bell.fill").font(.system(size: 20)).foregroundColor(.red)
                                    }else{
                                        Image(systemName:
                                                "bell").font(.system(size: 20)).foregroundColor(.red)
                                    }
                                }
                                Button {
                                    print("Text")
                                } label: {
                                    VStack{
                                        HStack{
                                            Text(TdsStructs[numero].title).fontWeight(.bold).foregroundColor(.white).lineLimit(1)
                                                .allowsTightening(false)
                                            Spacer()
                                            
                                        }
                                        HStack{
                                            Text(TdsStructs[numero].body).font(.system(size: 15)).foregroundColor(cor3).lineLimit(2)
                                                .allowsTightening(false)
                                            Spacer()
                                            Text("20/02 >").fontWeight(.bold).foregroundColor(cor3)
                                            
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

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
