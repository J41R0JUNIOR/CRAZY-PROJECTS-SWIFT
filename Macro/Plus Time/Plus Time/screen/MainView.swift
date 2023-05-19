import SwiftUI
 
struct MainView: View {
    
    
    
    //variaveis
    @State var tdsStructs:[baseStructure] = []
    @State var estadoModal1 = false
    @State var estadoModal2 = false
    
    @State var i:Int = 0
    
    var body: some View {
        
        ZStack {
            viewRoxa().ignoresSafeArea()
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
                    if(tdsStructs.count == 0){
                        
                        Text("Adicione algo!").foregroundColor(cor3).font(.system(size: 50)).border(cor2, width: 3)
                    }
                    //ScrollView dos horários
                    ScrollView {
                        
                        ForEach (tdsStructs.indices, id: \.self){index in
                            ZStack{
                                RoundedRectangle(cornerRadius: 15).foregroundColor(cor3)
                                    
                                HStack{
                                    Button {
                                        tdsStructs.remove(at: index)
                                    } label: {
                                        Image(systemName: "trash.slash.circle.fill").foregroundColor(cor2)
                                    }
                                    
                                    
                                    //botao do sino
                                    Button {
                                        print("Sininho fora Modal")
                                        tdsStructs[index].bell.toggle()
                                    } label: {
                                        if(tdsStructs[index].bell == true){
                                            Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(cor2)
                                        }else{
                                            Image(systemName:"bell").font(.system(size: 20)).foregroundColor(cor1)
                                        }
                                        
                                    }
                                    
                                    VStack{
                                        
                                        
                                        HStack{
                                            
                                            
                                            
                                            //entrar no modal de apresentação
                                            Button{
                                                print("entrar no modal de visualização", index)
                                                estadoModal2.toggle()
                                                i = index
                                            } label: {
                                                VStack{
                                                    HStack{
                                                        if(tdsStructs[index].title == ""){
                                                            Text("Add Título").foregroundColor(cor1)
                                                        }
                                                        Text(tdsStructs[index].title).fontWeight(.bold).foregroundColor(cor2).lineLimit(1)
                                                            .allowsTightening(false)
                                                        Spacer()
                                                    }
                                                    HStack{
                                                        if(tdsStructs[index].corpo == ""){
                                                            Text("Add Body").foregroundColor(cor2)
                                                        }
                                                        Text(tdsStructs[index].corpo).font(.system(size: 15)).foregroundColor(cor2).lineLimit(2)
                                                            .allowsTightening(false)
                                                        Spacer()
                                                    }
                                                }
                                                Spacer()
                                                
                                            }.sheet(isPresented: $estadoModal2) {
                                                ModalEntrar(estadoModal2: $estadoModal2, estadoModal1: $estadoModal1, index: index, secondaryVet: $tdsStructs[i].secondaryVet, title: $tdsStructs[i].title, notes: $tdsStructs[i].corpo, data: $tdsStructs[i].data, bell: $tdsStructs[i].bell)
                                            }
                                            
                                            
                                            
                                            //entrar no modal de edição
                                            Button{
                                                print("Entrar no modal de edição", index)
                                                estadoModal1.toggle()
                                                i = index
                                            } label: {
                                                
                                                
                                                
                                                //corpo da estrutura
                                                Text(tdsStructs[index].data).fontWeight(.bold).foregroundColor(cor3)
                                                if(tdsStructs[index].data == ""){
                                                    Text("Editar").foregroundColor(cor1)
                                                }
                                            }
                                            
                                            
                                            
                                            //passando parametros pro modal
                                            .sheet(isPresented: $estadoModal1) {
                                                ModalView(estadoModal1: $estadoModal1, index: i, title: $tdsStructs[i].title, notes: $tdsStructs[i].corpo, data: $tdsStructs[i].data, bell: $tdsStructs[i].bell, secondaryVet: $tdsStructs[i].secondaryVet)
                                            }
                                            
                                        }
                                        Divider().background(cor3)
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
