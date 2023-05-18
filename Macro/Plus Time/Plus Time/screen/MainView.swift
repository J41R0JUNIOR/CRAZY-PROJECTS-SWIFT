import SwiftUI
 
struct MainView: View {
    
    
    
    //variaveis
    @State var tdsStructs:[baseStructure] = []
    @State var estadoModal1 = false
    
    @State var i:Int = 0
    
    var body: some View {
        ZStack {
            Color(red:98/255, green: 84/255, blue:253/255).ignoresSafeArea()
            
            VStack{
                
                
                
                //Parte superior da tela
                HStack{
                    
                    
                    
                    //barra de pesquisa
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).frame(width: 308, height: 36).foregroundColor(cor3)
                        HStack{
                            
                            
                            
                            //pesquisa
                            Button {
                                print("lupa de pesquisa")
                            
                            } label: {
                                Image(systemName: "magnifyingglass").foregroundColor(cor2)
                                Text("Search").foregroundColor(cor2)
                            }

                            Spacer()
                        }.padding()
                    }
                    Spacer()
                    
                    
                    
                    //add eventos/tarefas
                    Button {
                        tdsStructs.append(baseStructure(title: "", corpo: "", bell: false, data: ""))
                        print("add evento")
                    } label: {
                        Image(systemName: "square.and.pencil").foregroundColor(cor3)
                    }
                }.padding()
                
                
                
                //Cor de fundo da ScrollView
                ZStack{
                    RoundedRectangle(cornerRadius: 15).foregroundColor(dark).frame(width: 385)
                    
                    
                    
                    //ScrollView dos horários
                    ScrollView {
                        ForEach (tdsStructs.indices, id: \.self){index in
                            HStack{
                                
                                
                                
                                //botao do sino
                                Button {
                                    print("Sininho fora Modal")
                                    tdsStructs[index].bell.toggle()
                                } label: {
                                    if(tdsStructs[index].bell == true){
                                        Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(cor2)
                                    }else{
                                        Image(systemName:"bell").font(.system(size: 20)).foregroundColor(cor3)
                                    }
                                    VStack{
                                        HStack{
                                            Text(tdsStructs[index].title).fontWeight(.bold).foregroundColor(.white).lineLimit(1)
                                                .allowsTightening(false)
                                            Spacer()
                                        }
                                        HStack{
                                            Text(tdsStructs[index].corpo).font(.system(size: 15)).foregroundColor(cor3).lineLimit(2)
                                                .allowsTightening(false)
                                            Spacer()
                                            Button{
                                                print("Entrar na estrutura", index)
                                                estadoModal1.toggle()
                                                i = index
                                            } label: {
                                                
                                                
                                                
                                                //corpo da estrutura
                                                Text(tdsStructs[index].data).fontWeight(.bold).foregroundColor(cor3)
                                                if(tdsStructs[index].data == ""){
                                                    Text("Editar")
                                                }
                                            }
                                            
                                            
                                            
                                            //passando parametros pro modal
                                            .sheet(isPresented: $estadoModal1) {
                                                ModalView(estadoModal1: $estadoModal1, index: i, title: $tdsStructs[i].title, notes: $tdsStructs[i].corpo, data: $tdsStructs[i].data, bell: $tdsStructs[i].bell, secondaryVet: $tdsStructs[i].secondaryVet)
                                            }
                                        }
                                        Divider().background(cor3)
                                    }
                                }
                            }.padding()
                        }
                    }
                }
            }.padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
