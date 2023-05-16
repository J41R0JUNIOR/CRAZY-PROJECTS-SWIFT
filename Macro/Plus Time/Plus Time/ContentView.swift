//
//  ContentView.swift
//  Plus Time
//
//  Created by Jairo Júnior on 12/05/23.
//
import SwiftUI
import UIKit

var red = 0
var green = 0
var blue = 0

//cores
let cor1 = Color(red:93/255, green: 31/255, blue:221/255)
let cor2 = Color(red:98/255, green: 84/255, blue:253/255)
let cor3 = Color(red:238/255, green: 224/255, blue:255/255)

let dark = Color(red:36/255, green: 36/255, blue:36/255)





struct ContentView: View {
    //vetor contendo as estruturas
    
    var body: some View {
        
        ZStack {
            HStack{
                TabView{
                    View1()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    View2()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                }.accentColor(.white)
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






var TdsStructs = [allStructures(title: "Título", body: "Label", bell: View1().$bell[0], text: View1().$titulo[0])]





var numViews : Int = TdsStructs.count





//Estruturas criadas pelo usuário para mostrar na tela inicial
struct allStructures{
    var title:String
    var body:String
    @Binding var bell:Bool
    @Binding var text:String
    
}






//modal de add eventos/tarefas
struct ModalView: View{
    @Binding var estadoModal1:Bool
    @Binding var bell:Bool
    @Binding var text:String
    
    var body: some View{
        ZStack{
            Color(red:36/255, green: 36/255, blue:36/255).ignoresSafeArea()
            
            VStack{
                HStack{
                    //fechar modal
                    Button {
                        estadoModal1.toggle()
                    } label: {
                        Text("Done").foregroundColor(cor3)
                    }
                    Spacer()
                    //add
                    Button {
                        print("ADD")
                    } label: {
                        Image(systemName: "square.and.pencil").foregroundColor(cor3)

                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 15).frame(width: 358, height: 73)
                    //sino
                    HStack{
                        Button {
                            print("Sininho dentro do Modal")
                            bell.toggle()
                        } label: {
                            if(bell == false){
                                Image(systemName:
                                        "bell.fill").font(.system(size: 20)).foregroundColor(.red)
                            }else{
                                Image(systemName:
                                        "bell").font(.system(size: 20)).foregroundColor(.red)
                            }
                        }
                        Spacer()

                        VStack{
                            Text(TdsStructs[TdsStructs.count-1].text).lineLimit(1)
                                .allowsTightening(false)
                            
                        }.padding()
                        Spacer()
                        
                    }.foregroundColor(.white).padding()
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 15).frame(width: 358, height: 73)
                    HStack{
                        Text("Notas:").lineLimit(1)
                            .allowsTightening(false).foregroundColor(cor3)
                        Spacer()
                    }.padding()
                }
                Spacer()
            }.padding()
        }
    }
}

//modal de mais info
struct ModalViewDetalhes: View{
    var body: some View{
        ZStack{
            
        }
    }
}
