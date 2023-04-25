//
//  marcasView.swift
//  FinalChallenge
//
//  Created by Jairo Júnior on 20/04/23.
//

import SwiftUI

struct marcasView: View {
    
    @State var corBotao1:Bool = false
    @State var corBotao2:Bool = false
    @State var corBotao3:Bool = false
    @State var estLigado:Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Toggle(isOn: $estLigado){
                        Text("Só aparecer os favoritos?")
                        if estLigado == true{
                            
                            if corBotao1 == true{
                                HStack{
                                    NavigationLink{
                                        VolksWagen(corBotao1: $corBotao1)
                                    }label: {
                                        Image("Image")
                                    }
                                    Button {
                                        corBotao1.toggle()
                                    } label: {
                                        if(corBotao1 == false){
                                            Image(systemName: "star")
                                        }else{
                                            Image(systemName: "star.fill").foregroundColor(.yellow)
                                        }
                                    }
                                }
                            }
                            ;if corBotao2 == true{
                                HStack{
                                    NavigationLink{
                                        Porche(corBotao2: $corBotao2)
                                    }label: {
                                        Image("Image 1")
                                    }
                                    Button {
                                        corBotao2.toggle()
                                    } label: {
                                        if(corBotao2 == false){
                                            Image(systemName: "star")
                                        }else{
                                            Image(systemName: "star.fill").foregroundColor(.yellow)
                                        }
                                    }
                                }
                            }
                            if corBotao3 == true{
                                HStack{
                                    NavigationLink{
                                        Toyota(corBotao3: $corBotao3)
                                    }label: {
                                        Image("Image 2")
                                    }
                                    Button {
                                        corBotao3.toggle()
                                    } label: {
                                        if(corBotao3 == false){
                                            Image(systemName: "star")
                                        }else{
                                            Image(systemName: "star.fill").foregroundColor(.yellow)
                                        }
                                    }
                                }
                            }
                        }else{
                            HStack{
                                NavigationLink{
                                    VolksWagen(corBotao1: $corBotao1)
                                }label: {
                                    Image("Image")
                                }
                                Button {
                                    corBotao1.toggle()
                                } label: {
                                    if(corBotao1 == false){
                                        Image(systemName: "star")
                                    }else{
                                        Image(systemName: "star.fill").foregroundColor(.yellow)
                                    }
                                }
                            }
                            HStack{
                                NavigationLink{
                                    Porche(corBotao2: $corBotao2)
                                }label: {
                                    Image("Image 1")
                                }
                                Button {
                                    corBotao2.toggle()
                                } label: {
                                    if(corBotao2 == false){
                                        Image(systemName: "star")
                                    }else{
                                        Image(systemName: "star.fill").foregroundColor(.yellow)
                                    }
                                }
                            }
                            HStack{
                                NavigationLink{
                                    Toyota(corBotao3: $corBotao3)
                                }label: {
                                    Image("Image 2")
                                }
                                Button {
                                    corBotao3.toggle()
                                } label: {
                                    if(corBotao3 == false){
                                        Image(systemName: "star")
                                    }else{
                                        Image(systemName: "star.fill").foregroundColor(.yellow)
                                    }
                                }
                            }
                        }
                    }
                }.padding()
                
                
            }
        }
    }
}

struct marcasView_Previews: PreviewProvider {
    static var previews: some View {
        marcasView()
    }
}

struct VolksWagen: View {
    
    @Binding var corBotao1:Bool
    
    var body: some View {
        ScrollView{
            VStack{
                detalhesView()
                HStack{
                    Spacer()
                    Button {
                        corBotao1.toggle()
                    } label: {
                        if(corBotao1 == false){
                            Image(systemName: "star")
                        }else{
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                        }
                    }
                }
            }
        }.padding()
    }
}
    
struct Porche: View {
    
    @Binding var corBotao2:Bool
    
    var body: some View {
        ScrollView{
            VStack{
                detalhesView1()
                HStack{
                    Spacer()
                    Button {
                        corBotao2.toggle()
                    } label: {
                        if(corBotao2 == false){
                            Image(systemName: "star")
                        }else{
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                        }
                    }
                }
            }
        }.padding()
    }
}
    
struct Toyota: View {
    
    @Binding var corBotao3:Bool
    
    var body: some View {
        ScrollView{
            VStack{
                detalhesView2()
                HStack{
                    Spacer()
                    Button {
                        corBotao3.toggle()
                    } label: {
                        if(corBotao3 == false){
                            Image(systemName: "star")
                        }else{
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                        }
                    }
                }
            }
        }.padding()
    }
}

