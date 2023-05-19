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
    @State var remover = false
    
    var body: some View{
        ZStack{
            viewEscura().ignoresSafeArea()
            
            VStack{
                HStack{
                    
                    
                    
                    //fechar modal
                    Button {
                        estadoModal1.toggle()
                        if(remover == true){
                            remover.toggle()
                        }
                    } label: {
                        Text("Done").foregroundColor(roxoLeve)
                    }
                    Spacer()
                    
                    
                    
                    //add
                    
                    Image(systemName: "square.and.pencil").font(.system(size: 20)).foregroundColor(roxoLeve)
                    .padding()
                    .contextMenu {
                        Button {
                            secondaryVet.append(secondStructure(title2: "", corpo2: "", data2: ""))
                            if(remover == true){
                                remover.toggle()
                            }
                        } label: {
                            Label("Adicionar", systemImage: "square.and.pencil")
                            Image(systemName: "square.and.pencil").font(.system(size: 20)).foregroundColor(roxoLeve)
                        }
                        Button {
                            remover.toggle()
                        }label: {
                            Label("Remover", systemImage: "trash.slash")
                        }
                        
                    }
                }.padding()
                ZStack{
                    RoundedRectangle(cornerRadius: 15).frame(width: 358, height: 150).foregroundColor(dark2)
                    
                    
                    
                    //sino
                    HStack{
                        Button {
                            bell.toggle()
                        } label: {
                            if(bell == true){
                                Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(roxo)
                            }else{
                                Image(systemName:"bell").font(.system(size: 20)).foregroundColor(roxoLeve)
                            }
                        }
                        Spacer()
                        
                        
                        
                        //texto
                        VStack{
                            TextField("Digite o Título", text: $title).disableAutocorrection(true).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                            
                            
                            
                            //Text("\(title) [\(index)]")
                            TextField("Notas", text: $notes).disableAutocorrection(true).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                            
                            
                            
                            //Text("\(notes) [\(index)]")
                            TextField("Data: dd/mm", text: $data).disableAutocorrection(true).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                            
                        }.padding()
                        Spacer()
                        
                        
                        
                        
                    }.foregroundColor(.white).padding()
                    
                }
                
                    HStack{
                        ScrollView{
                            ForEach(secondaryVet.indices, id: \.self) { vet in
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15).frame(width: 358).foregroundColor(dark2)
                                    VStack{
                                        HStack{
                                            if(remover == true){
                                                Button {
                                                    secondaryVet.remove(at: vet)
                                                } label: {
                                                    Image(systemName: "trash.slash.circle.fill").font(.system(size: 25)).foregroundColor(roxo)
                                                }
                                                Spacer()
                                            }
                                        }
                                        Text(secondaryVet[vet].title2).foregroundColor(roxo)
                                        TextField("Título", text: $secondaryVet[vet].title2).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                                        TextField("Nota", text: $secondaryVet[vet].corpo2).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                                        TextField("Data: dd/mm", text: $secondaryVet[vet].data2).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                                    }.padding()
                                }.padding()
                            }
                        }
                    }
                
                
                
                Spacer()
            }
        }
    }
}

