//modal de add eventos/tarefas

import SwiftUI
struct ModalView: View{
    @Binding var estadoModal1:Bool
    
    
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
                    RoundedRectangle(cornerRadius: 15).frame(width: 358, height: 73)
                    //sino
                    HStack{
                        Button {
                            print("Sininho dentro do Modal")
                            
                        } label: {
                            Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(.red)
                            
                        }
                        Spacer()

                        VStack{
                            
                            
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
