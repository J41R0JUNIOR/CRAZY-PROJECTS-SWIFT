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





var TdsEstructs = [allStructures(title: "Teste", body: "If the user try to put more than allowed", bell: false)]





//Estruturas criadas pelo usuário para mostrar na tela inicial
struct allStructures{
    var title:String
    var body:String
    @State var bell:Bool
    
}








//modal de add eventos/tarefas
struct ModalView: View{
    @Binding var estadoModal:Bool
    
    var body: some View{
        ZStack{
            Color(red:36/255, green: 36/255, blue:36/255).ignoresSafeArea()
            
            VStack{
                HStack{
                    //fechar modal
                    Button {
                        estadoModal.toggle()
                    } label: {
                        Text("Cancel").foregroundColor(cor3)
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
                    
                    HStack{
                        Button {
                            print("Sininho dentro do Modal")
                        } label: {
                            Image(systemName:
                                    "bell.fill").font(.system(size: 20)).foregroundColor(.red)
                        }

                        
                        Spacer()

                        VStack{
                            Text("Título da atividade").lineLimit(1)
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
