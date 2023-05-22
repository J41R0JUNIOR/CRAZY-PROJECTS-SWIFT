//modal de add eventos/tarefas
import SwiftUI



struct ModalView: View{
    
    
    
    //variaveis
    @Binding var estadoModal1:Bool
    var index:Int
    @Binding var title:String
    @Binding var notes:String
    @Binding var data:Date
    @Binding var bell:Bool
    @Binding var secondaryVet:[secondStructure]
    @State var remover = false
    
    //@State private var datePicked = Date()
    
   
    
    var body: some View{
        ZStack{
            viewRoxa().ignoresSafeArea()
            
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
                    }.padding(.horizontal)
                    Spacer()
                    
                    
                    
                    //add
                    Image(systemName: "square.and.pencil").font(.system(size: 20)).foregroundColor(roxoLeve)
                    
                    .contextMenu {
                        Button {
                            secondaryVet.append(secondStructure(title2: "", corpo2: "", data2: Date()))
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
                            if(remover == false){
                                Label("Remover", systemImage: "trash.slash")
                            }else{
                                Label("Pronto", systemImage: "return")
                            }                        }
                        
                    }.padding(.horizontal)
                }.padding(.horizontal)
                ZStack{
                    /*
                    LinearGradient(colors: [roxoAcentuado],
                                         startPoint: .top,
                                   endPoint: .bottom).cornerRadius(15).frame(width: 358, height: 150)
                    */
                    
                    
                    
                    //sino
                    HStack{
                        Button {
                            bell.toggle()
                        } label: {
                            if(bell == true){
                                Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(roxoLeve)
                            }else{
                                Image(systemName:"bell").font(.system(size: 20)).foregroundColor(roxoLeve)
                            }
                        }
                        
                    }.foregroundColor(.white)
                    
                }.padding(.horizontal)
                
                    HStack{
                        ScrollView{
                            VStack{
                                
                                TextField("Digite o Título", text: $title).frame(width: 360, alignment: .leading).disableAutocorrection(true).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                                
                                
                                
                                //Text("\(title) [\(index)]")
                                TextEditor(text: $notes)
                                    .font(.custom("HelveticaNeue", size: 15)).font(.body)
                                    .frame(width: 360, height: 80, alignment: .leading)
                                    .lineLimit(1)
                                    .allowsTightening(false).cornerRadius(5)
                                /*
                                TextField("Notas", text: $notes).disableAutocorrection(true).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                                */
                                
                                
                                //Text("\(notes) [\(index)]")
                                HStack{
                                    Spacer()
                                    
                                    DatePicker("", selection: $data, in: Date()...).foregroundColor(roxoLeve)
                                    //TextField("Data:", text: $data).frame(width: 100).disableAutocorrection(true).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                                }.padding(.horizontal)
                            }.padding()
                            ForEach(secondaryVet.indices, id: \.self) { vet in
                                ZStack{
                                    /*
                                    RadialGradient(colors: [roxoAcentuado, roxoEscuro],
                                                           center: .center,
                                                           startRadius: 20,
                                                           endRadius: 150).cornerRadius(15)
                                     */
                                    /*
                                    LinearGradient(colors: [roxoEscuro],
                                                         startPoint: .top,
                                                   endPoint: .bottom).cornerRadius(15)
                                     */
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
                                        TextField("Título", text: $secondaryVet[vet].title2).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                                        
                                        TextEditor(text: $secondaryVet[vet].corpo2)
                                            .font(.custom("HelveticaNeue", size: 15)).font(.body)
                                            .frame(width: 360, height: 80, alignment: .leading)
                                            
                                        HStack{
                                            Spacer()
                                            DatePicker("", selection: $secondaryVet[vet].data2, in: Date()..., displayedComponents: .date).foregroundColor(roxoLeve)
                                            
                                        }
                                    }.padding()
                                }.padding()
                            }
                        }
                    }
                
                
                
                Spacer()
            }.padding()
        }
    }
}

