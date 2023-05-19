//
//  ModalEditar.swift
//  Plus Time
//
//  Created by Jairo Júnior on 17/05/23.
//

import SwiftUI

struct ModalEntrar: View {
    
    
    
    //variaveis
    @Binding var estadoModal2:Bool
    @Binding var estadoModal1:Bool
    var index:Int
    @Binding var secondaryVet:[secondStructure]
    
    @Binding var title:String
    @Binding var notes:String
    @Binding var data:String
    @Binding var bell:Bool
    
    var body: some View {
        ZStack{
            viewEscura().ignoresSafeArea()
            VStack{
                VStack{
                    HStack{
                        
                        
                        
                        //fechar o modal
                        Button {
                            estadoModal2.toggle()
                        } label: {
                            Text("Done").foregroundColor(cor3)
                        }
                        Spacer()
                        
                        
                        
                        //editar
                        Button {
                            print("edit")
                            estadoModal2.toggle()
                            estadoModal1.toggle()
                        } label: {
                            Text("Edit").foregroundColor(cor3)
                        }
                        
                        
                    }.padding()
                    ZStack{
                        
                        
                        
                        //Corpo do modal
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 14).frame(width: 358, height: 150).foregroundColor(dark2)
                                HStack{
                                    //sino
                                    Button {
                                        print("Sininho dentro do Modal", index)
                                        bell.toggle()
                                    } label: {
                                        if(bell == true){
                                            Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(cor2)
                                        }else{
                                            Image(systemName:"bell").font(.system(size: 20)).foregroundColor(cor3)
                                        }
                                    }
                                    VStack{
                                        Text("Title: \(title)").foregroundColor(cor3)
                                        Text("Notes: \(notes)").foregroundColor(cor3)
                                        Text("Date: \(data)").foregroundColor(cor3)
                                        
                                        
                                        
                                    }
                                    Spacer()
                                }.padding()
                            }
                            
                            VStack{
                                ScrollView{
                                    ForEach(secondaryVet.indices, id: \.self) { vet in
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 15).frame(width: 358, height: 150).foregroundColor(dark2)
                                            HStack{
                                                VStack{
                                                    Text("Título: \(secondaryVet[vet].title2)").foregroundColor(cor3)
                                                    Text("Nota: \(secondaryVet[vet].corpo2)").foregroundColor(cor3)
                                                    Text("Data: \(secondaryVet[vet].data2)").foregroundColor(cor3)
                                                }.padding()
                                                Spacer()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }.padding()
                }
                Spacer()
            }
        }
    }
}
