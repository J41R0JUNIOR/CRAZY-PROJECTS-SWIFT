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
    
    @Binding var tasks:[TaskMetaData]
    
    var body: some View {
        ZStack{
            //viewRoxa().ignoresSafeArea()
            VStack{
                VStack{
                    HStack{
                        
                        
                        
                        //fechar o modal
                        Button {
                            estadoModal2.toggle()
                            estadoModal1.toggle()
                        } label: {
                            Text("Done").foregroundColor(roxo)
                        }
                        Spacer()
                        Button {
                            estadoModal2.toggle()
                        } label: {
                            Text("Edit").foregroundColor(roxo)
                        }
                        
                        //editar
                        
                    }.padding()
                    
                    Button {
                        bell.toggle()
                    } label: {
                        if(bell == true){
                            Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(roxo)
                        }else{
                            Image(systemName:"bell").font(.system(size: 20)).foregroundColor(roxo)
                        }
                    }
                        
                        
                        
                        //Corpo do modal
                        VStack{
                            
                            
                            VStack{
                                Form{
                                    
                                    Section{
                                        
                                        if(title == ""){
                                            Text("Title").font(.system(size: 20))
                                                .foregroundColor(roxo)
                                                .bold()
                                        }
                                        Text("\(title)").font(.system(size: 20))
                                            .foregroundColor(roxo)
                                            .bold()
                                        
                                        if(notes == ""){
                                            Text("Notes")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15))
                                        }
                                        Text("\(notes)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                        
                                        Text("\(data.formatted())")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .font(.system(size: 15))
                                    }
                                    Section{
                                        ForEach(secondaryVet.indices, id: \.self) { vet in
                                            
                                            if(secondaryVet[vet].title2 == ""){
                                                Text("Title")
                                                    .font(.system(size: 20))
                                                    .foregroundColor(roxo)
                                                    .bold()
                                            }
                                            Text("\(secondaryVet[vet].title2)")
                                                .font(.system(size: 20))
                                                .foregroundColor(roxo)
                                                .bold()
                                            
                                            if(secondaryVet[vet].corpo2 == ""){
                                                Text("Notes")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 15))
                                            }
                                            Text("\(secondaryVet[vet].corpo2)")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15))
                                            
                                            Text("\(secondaryVet[vet].data2.formatted())")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15))
                                                .font(.system(size: 15))
                                        }
                                    }
                                }
                                    /*ScrollView{
                                        ZStack{
                                            
                                            RoundedRectangle(cornerRadius: 14).frame(width: 355).foregroundColor(roxoEscuro)
                                            HStack{
                                                //sino
                                                
                                                VStack{
                                                    
                                                    if(title == ""){
                                                        Text("Title").font(.system(size: 20))
                                                    }
                                                    Text("\(title)").font(.system(size: 20)).foregroundColor(roxoClaro)
                                                    
                                                    if(notes == ""){
                                                        Text("Notes").foregroundColor(roxoClaro).font(.system(size: 15))
                                                    }
                                                    Text("\(notes)").foregroundColor(roxoClaro).font(.system(size: 15))
                                                    Spacer()
                                                    Text("\(data.formatted())").foregroundColor(roxoClaro).font(.system(size: 15)).font(.system(size: 15))
                                                    
                                                    
                                                    
                                                }.foregroundColor(roxoClaro)
                                                
                                            }.padding()
                                        }.padding()
                                        ForEach(secondaryVet.indices, id: \.self) { vet in
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 15).frame(width: 358).foregroundColor(dark2)
                                                HStack{
                                                    VStack{
                                                        if(secondaryVet[vet].title2 == ""){
                                                            Text("Title").font(.system(size: 20)).foregroundColor(roxoClaro)
                                                        }
                                                        Text("\(secondaryVet[vet].title2)").font(.system(size: 20)).foregroundColor(roxoClaro)
                                                        if(secondaryVet[vet].corpo2 == ""){
                                                            Text("Notes").foregroundColor(roxoClaro).font(.system(size: 15))
                                                        }
                                                        Text("\(secondaryVet[vet].corpo2)").foregroundColor(roxoClaro).font(.system(size: 15))
                                                        
                                                        Text("\(secondaryVet[vet].data2.formatted())").foregroundColor(roxoClaro).font(.system(size: 15)).font(.system(size: 15))
                                                    }.padding()
                                                    
                                                }
                                            }.padding()
                                        }
                                    }*/
                                
                            }
                        }
                    
                }
                Spacer()
            }
        }
    }
}

struct Modal_Previews: PreviewProvider {
    @Binding var tasks:[TaskMetaData]
    static var previews: some View {
        ContentView()
    }
}

