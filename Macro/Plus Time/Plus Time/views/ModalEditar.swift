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
                        secondaryVet.append(secondStructure(title2: "adas", corpo2: "asdas", data2: "asdas"))
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
                                Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(cor3)
                            }else{
                                Image(systemName:"bell").font(.system(size: 20)).foregroundColor(cor3)
                            }
                        }
                        Spacer()
                        
                        
                        
                        //texto
                        VStack{
                            TextField("Digite o Texto", text: $title).textFieldStyle(.roundedBorder).foregroundColor(cor1)
                            
                            
                            
                            //Text("\(title) [\(index)]")
                            TextField("Notas", text: $notes).textFieldStyle(.roundedBorder)
                            
                            
                            
                            //Text("\(notes) [\(index)]")
                            TextField("Data: dd/mm", text: $data).textFieldStyle(.roundedBorder)
                            
                        }.padding()
                        Spacer()
                        
                        
                        
                        
                    }.foregroundColor(.white).padding()
                    
                }
                
                    HStack{
                        ScrollView{
                            ForEach(secondaryVet.indices, id: \.self) { vet in
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15).frame(width: 358, height: 150).foregroundColor(dark2)
                                    Text(secondaryVet[vet].title2)
                                }
                            }
                        }
                    }
                
                
                
                Spacer()
            }.padding()
        }
    }
}

