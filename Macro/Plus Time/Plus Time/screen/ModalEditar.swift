//modal de add eventos/tarefas
import SwiftUI



struct ModalView: View{
    
    
    
    //variaveis
    @Binding var estadoModal1:Bool
    var index:Int
    @Binding var title:String
    @Binding var notes:String
    @Binding var data:String
    @Binding var bell:Bool
    @Binding var secondaryVet:[secondStructure]
    
    var body: some View{
        ZStack{
            viewEscura().ignoresSafeArea()
            
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
                        secondaryVet.append(secondStructure(title2: "", corpo2: "", data2: ""))
                    } label: {
                        Image(systemName: "square.and.pencil").foregroundColor(cor3)
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 15).frame(width: 358, height: 150).foregroundColor(dark2)
                    
                    
                    
                    //sino
                    HStack{
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
                        Spacer()
                        
                        
                        
                        //texto
                        VStack{
                            TextField("Digite o Título", text: $title).disableAutocorrection(true).textFieldStyle(.roundedBorder).foregroundColor(cor1)
                            
                            
                            
                            //Text("\(title) [\(index)]")
                            TextField("Notas", text: $notes).disableAutocorrection(true).textFieldStyle(.roundedBorder).foregroundColor(cor1)
                            
                            
                            
                            //Text("\(notes) [\(index)]")
                            TextField("Data: dd/mm", text: $data).disableAutocorrection(true).textFieldStyle(.roundedBorder).foregroundColor(cor1)
                            
                        }.padding()
                        Spacer()
                        
                        
                        
                        
                    }.foregroundColor(.white).padding()
                    
                }
                
                    HStack{
                        ScrollView{
                            ForEach(secondaryVet.indices, id: \.self) { vet in
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15).frame(width: 358, height: 150).foregroundColor(dark2)
                                    VStack{
                                        HStack{
                                            Button {
                                                print("+")
                                            } label: {
                                                Image(systemName: "trash.slash.circle.fill").foregroundColor(cor2)
                                            }
                                            Spacer()
                                        }
                                        Text(secondaryVet[vet].title2).foregroundColor(cor2)
                                        TextField("Título", text: $secondaryVet[vet].title2).textFieldStyle(.roundedBorder).foregroundColor(cor1)
                                        TextField("Nota", text: $secondaryVet[vet].corpo2).textFieldStyle(.roundedBorder).foregroundColor(cor1)
                                        TextField("Data: dd/mm", text: $secondaryVet[vet].data2).textFieldStyle(.roundedBorder).foregroundColor(cor1)
                                    }.padding()
                                }
                            }
                        }
                    }
                
                
                
                Spacer()
            }.padding()
        }
    }
}

