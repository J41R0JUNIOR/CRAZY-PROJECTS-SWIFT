//modal de add eventos/tarefas

import SwiftUI
struct ModalView: View{
    
    //variaveis
    
    @Binding var estadoModal1:Bool
    var index:Int
    @Binding var title:String
    @Binding var notes:String
    @Binding var data:String
    
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
                    RoundedRectangle(cornerRadius: 15).frame(width: 358, height: 150)
                    //sino
                    HStack{
                        Button {
                            print("Sininho dentro do Modal", index)
                            
                        } label: {
                            Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(.red)
                            
                        }
                        Spacer()
                        
                        //texto
                        VStack{
                            TextField("Digite o Texto", text: $title).textFieldStyle(.roundedBorder).foregroundColor(.black)
                            //Text("\(title) [\(index)]")
                          
                            TextField("Notas", text: $notes).textFieldStyle(.roundedBorder).foregroundColor(.black)
                            //Text("\(notes) [\(index)]")
                            
                            TextField("Data", text: $data).textFieldStyle(.roundedBorder).foregroundColor(.black)
                            
                        }.padding()
                        
                        
                    }.foregroundColor(.white).padding()
                    
                }
                
                Spacer()
            }.padding()
        }
    }
}
