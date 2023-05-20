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
    @Binding var data:Date
    @Binding var bell:Bool
    
    var body: some View {
        ZStack{
            viewRoxa().ignoresSafeArea()
            VStack{
                VStack{
                    HStack{
                        
                        
                        
                        //fechar o modal
                        Button {
                            estadoModal2.toggle()
                        } label: {
                            Text("Done").foregroundColor(roxoLeve)
                        }
                        Spacer()
                        
                        
                        
                        //editar
                        Button {
                            estadoModal2.toggle()
                            estadoModal1.toggle()
                        } label: {
                            Text("Edit").foregroundColor(roxoLeve)
                        }
                        
                        
                    }.padding()
                    
                    Button {
                        bell.toggle()
                    } label: {
                        if(bell == true){
                            Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(roxoLeve)
                        }else{
                            Image(systemName:"bell").font(.system(size: 20)).foregroundColor(roxoLeve)
                        }
                    }
                        
                        
                        
                        //Corpo do modal
                        VStack{
                            
                            
                            VStack{
                                
                                    ScrollView{
                                        ZStack{
                                            
                                            RoundedRectangle(cornerRadius: 14).frame(width: 390).foregroundColor(roxoEscuro)
                                            HStack{
                                                //sino
                                                
                                                VStack{
                                                    if(title == ""){
                                                        Text("Title").font(.system(size: 20))
                                                    }
                                                    Text("\(title)").font(.system(size: 20)).foregroundColor(roxoLeve)
                                                    
                                                    if(notes == ""){
                                                        Text("Notes").foregroundColor(roxoLeve).font(.system(size: 15))
                                                    }
                                                    Text("\(notes)").foregroundColor(roxoLeve).font(.system(size: 15))
                                                    Spacer()
                                                    Text("\(data.formatted())").foregroundColor(roxoLeve).font(.system(size: 15)).font(.system(size: 15))
                                                    
                                                    
                                                    
                                                }.foregroundColor(roxoLeve)
                                                
                                            }.padding()
                                        }
                                        ForEach(secondaryVet.indices, id: \.self) { vet in
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 15).frame(width: 358).foregroundColor(dark2)
                                                HStack{
                                                    VStack{
                                                        if(secondaryVet[vet].title2 == ""){
                                                            Text("Title").font(.system(size: 20)).foregroundColor(roxoLeve)
                                                        }
                                                        Text("\(secondaryVet[vet].title2)").font(.system(size: 20)).foregroundColor(roxoLeve)
                                                        if(secondaryVet[vet].corpo2 == ""){
                                                            Text("Notes").foregroundColor(roxoLeve).font(.system(size: 15))
                                                        }
                                                        Text("\(secondaryVet[vet].corpo2)").foregroundColor(roxoLeve).font(.system(size: 15))
                                                        Text("\(secondaryVet[vet].data2)").foregroundColor(roxoLeve).font(.system(size: 15))
                                                    }.padding()
                                                    
                                                }
                                            }.padding()
                                        }
                                    }
                                
                            }
                        }
                    
                }
                Spacer()
            }
        }
    }
}
