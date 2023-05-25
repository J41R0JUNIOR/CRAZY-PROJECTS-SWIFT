import SwiftUI
 

/*
class arraY: ObservableObject{
    @Published var tasks:[TaskMetaData] = [ TaskMetaData(task: [
        Task(title: "Talk to Justine"),
        Task(title: "iPhone 13 Great Design ChangeS"),
        Task(title: "Nothing Much Workout !!!")
        ], taskDate: getSampleDate(offset: 1)),
}
*/

struct MainView: View{
    
    
    
    //variaveis
    
    @State var estadoModal1 = false
    @State var estadoModal2 = false
    @State var remover = false
    //vetor onde tenho as estruturas
    @State var tdsStructs:[baseStructure] = []
    @State var i:Int = 0
    @State var pesquisa = ""
    @State var toggle = false
    //vetor do calendário e suas tasks
    @Binding var tasks:[TaskMetaData]
    @State var j:Int = 0
    var body: some View {
        ZStack {
            
            //viewRoxa().ignoresSafeArea()
            
            
            VStack{
                
                
                
                //Parte superior da tela
                HStack{
                    Spacer()
                    //add eventos/tarefas
                    if remover == false{
                        
                        
                        
                        Menu(content: {
                            Button {
                                tdsStructs.append(baseStructure(title: "", corpo: "", bell: false, data: Date()))
                                
                                tasks.append(TaskMetaData(task: [Task(title: tdsStructs[i].title)], taskDate: tdsStructs[i].data))
                                
                                if(remover == true){
                                    remover.toggle()
                                }
                                j = tdsStructs.count-1
                                i = j
                                print(j)
                                estadoModal1.toggle()
                                
                            } label: {
                                Label("Adicionar", systemImage: "square.and.pencil")
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 20))
                                
                            }
                            Button {
                                remover.toggle()
                            } label: {
                                if(remover == false){
                                    Label("Remover", systemImage: "trash.slash")
                                }else{
                                    Label("Pronto", systemImage: "return")
                                }
                            }
                        }, label: {
                            Image(systemName: "square.and.pencil").font(.system(size: 20)).foregroundColor(roxo)
                        })
                        
                        
                    }else{
                        Button {
                            remover.toggle()
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 20))
                                .foregroundColor(roxo)
                        }

                    }
                }
                
                
                
                
                
                
                //Cor de fundo da ScrollView
               
                
                //ScrollView dos horários
                
                ScrollView {
                    HStack{
                        Text("Plus time").bold().font(.system(size: 30)).foregroundColor(roxoAcentuado)
                        Spacer()
                    }
                    //barra de pesquisa
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).frame(width: 350, height: 36).foregroundColor(roxoAcentuado)
                        HStack{
                            if(pesquisa == ""){
                                Image(systemName: "magnifyingglass").foregroundColor(roxoClaro)
                            }
                            TextField("Search", text: $pesquisa)
                                .textFieldStyle(.roundedBorder)
                                
                                .foregroundColor(.white)
                            
                            
                            
                            //pesquisa 
                        }.padding()
                    }
                    
                    Spacer()
                    
                    if (pesquisa != ""){
                        ForEach (tdsStructs.indices, id: \.self){index2 in
                            if(tdsStructs[index2].title == pesquisa){
                                //Text("achou")
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15).foregroundColor(roxoEscuro)
                                    
                                    HStack{
                                        if(remover == true){
                                            Button {
                                                
                                                tdsStructs.remove(at: index2)
                                                tasks.remove(at: index2)
                                                 
                                            } label: {
                                                Image(systemName: "trash.slash.circle.fill").font(.system(size:25)).foregroundColor(.red)
                                            }
                                        }
                                        
                                        //botao do sino
                                        Button {
                                            tdsStructs[index2].bell.toggle()
                                        } label: {
                                            if(tdsStructs[index2].bell == true){
                                                Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(roxoClaro)
                                            }else{
                                                Image(systemName:"bell").font(.system(size: 20)).foregroundColor(roxoClaro)
                                            }
                                        }
                                        VStack{
                                            HStack{
                                                
                                                
                                                
                                                //entrar no modal de apresentação
                                                Button{
                                                    estadoModal2.toggle()
                                                    i = index2
                                                    if(remover == true){
                                                        remover.toggle()
                                                    }
                                                } label: {
                                                    VStack{
                                                        HStack{
                                                            if(tdsStructs[index2].title == ""){
                                                                Text("Add Título").fontWeight(.bold).foregroundColor(.primary)
                                                            }
                                                            Text(tdsStructs[index2].title).fontWeight(.bold).foregroundColor(.primary).lineLimit(1)
                                                                .allowsTightening(false)
                                                            Spacer()
                                                        }
                                                        HStack{
                                                            if(tdsStructs[index2].corpo == ""){
                                                                Text("Add Body").font(.system(size: 13)).foregroundColor(.secondary)
                                                            }
                                                            Text(tdsStructs[index2].corpo).font(.system(size: 13)).foregroundColor(.secondary).lineLimit(2)
                                                                .allowsTightening(false)
                                                            Spacer()
                                                        }
                                                    }
                                                    Spacer()
                                                    
                                                }.sheet(isPresented: $estadoModal2) {
                                                    ModalEntrar(estadoModal2: $estadoModal2, estadoModal1: $estadoModal1, index: index2, secondaryVet: $tdsStructs[i].secondaryVet, title: $tdsStructs[i].title, notes: $tdsStructs[i].corpo, data: $tdsStructs[i].data, bell: $tdsStructs[i].bell, tasks: $tasks)
                                                }
                                                
                                                
                                                
                                                //entrar no modal de edição
                                                Button{
                                                    estadoModal1.toggle()
                                                    i = index2
                                                } label: {
                                                    
                                                    //Text("Comming...")
                                                    Text(tdsStructs[i].data.formatted()).foregroundColor(.primary)
                                                    //corpo da estrutura
                                                    /*
                                                     if(tdsStructs[index].data == ""){
                                                     Text("Editar").foregroundColor(roxo)
                                                     }
                                                     Text(tdsStructs[index].data).font(.system(size: 15)).fontWeight(.bold).foregroundColor(roxo)
                                                     */
                                                }
                                                
                                                
                                                
                                                //passando parametros pro modal
                                                .sheet(isPresented: $estadoModal1) {
                                                    ModalView(estadoModal1: $estadoModal1, indice: i, title: $tdsStructs[i].title, notes: $tdsStructs[i].corpo, data: $tdsStructs[i].data, bell: $tdsStructs[i].bell, secondaryVet: $tdsStructs[i].secondaryVet, tasks: $tasks)
                                                }
                                            }
                                            //Divider().background(roxoLeve)
                                        }
                                    }.padding()
                                }
                            }
                        }
                    }else{
                        
                        ForEach (tdsStructs.indices, id: \.self){index in
                            ZStack{
                                RoundedRectangle(cornerRadius: 15).foregroundColor(roxoEscuro)
                                
                                HStack{
                                    if(remover == true){
                                        Button {
                                            tdsStructs.remove(at: index)
                                            tasks.remove(at: index)
                                            
                                            
                                        } label: {
                                            Image(systemName: "trash.slash.circle.fill").font(.system(size:25)).foregroundColor(.red)
                                        }
                                    }
                                    
                                    //botao do sino
                                    Button {
                                        tdsStructs[index].bell.toggle()
                                    } label: {
                                        if(tdsStructs[index].bell == true){
                                            Image(systemName:"bell.fill").font(.system(size: 20)).foregroundColor(roxoClaro)
                                        }else{
                                            Image(systemName:"bell").font(.system(size: 20)).foregroundColor(roxoClaro)
                                        }
                                    }
                                    VStack{
                                        HStack{
                                            
                                            
                                            
                                            //entrar no modal de apresentação
                                            Button{
                                                estadoModal2.toggle()
                                                i = index
                                                if(remover == true){
                                                    remover.toggle()
                                                }
                                            } label: {
                                                VStack{
                                                    HStack{
                                                        if(tdsStructs[index].title == ""){
                                                            Text("Add Título").fontWeight(.bold).foregroundColor(.primary)
                                                        }
                                                        Text(tdsStructs[index].title).fontWeight(.bold).foregroundColor(.primary).lineLimit(1)
                                                            .allowsTightening(false)
                                                        Spacer()
                                                    }
                                                    HStack{
                                                        if(tdsStructs[index].corpo == ""){
                                                            Text("Add Body").font(.system(size: 13)).foregroundColor(.secondary)
                                                        }
                                                        Text(tdsStructs[index].corpo).font(.system(size: 13)).foregroundColor(.secondary).lineLimit(2)
                                                            .allowsTightening(false)
                                                        Spacer()
                                                    }
                                                }
                                                Spacer()
                                               //
                                                //
                                                //
                                                //
                                                //
                                                //
                                                //
                                            }.sheet(isPresented: $estadoModal2) {
                                                ModalEntrar(estadoModal2: $estadoModal2, estadoModal1: $estadoModal1, index: index, secondaryVet: $tdsStructs[i].secondaryVet, title: $tdsStructs[i].title, notes: $tdsStructs[i].corpo, data: $tdsStructs[i].data, bell: $tdsStructs[i].bell, tasks: $tasks)
                                            }
                                            
                                            
                                            
                                            //entrar no modal de edição
                                            Button{
                                                estadoModal1.toggle()
                                                i = index
                                            } label: {
                                                
                                                //Text("Comming...")
                                                Text(tdsStructs[index].data.formatted()).foregroundColor(.primary)
                                                //corpo da estrutura
                                                /*
                                                 if(tdsStructs[index].data == ""){
                                                 Text("Editar").foregroundColor(roxo)
                                                 }
                                                 Text(tdsStructs[index].data).font(.system(size: 15)).fontWeight(.bold).foregroundColor(roxo)
                                                 */
                                            }
                                            
                                            
                                            
                                            //passando parametros pro modal
                                            .sheet(isPresented: $estadoModal1) {
                                                ModalView(estadoModal1: $estadoModal1, indice: i, title: $tdsStructs[i].title, notes: $tdsStructs[i].corpo, data: $tdsStructs[i].data, bell: $tdsStructs[i].bell, secondaryVet: $tdsStructs[i].secondaryVet, tasks: $tasks)
                                            }
                                        }
                                        //Divider().background(roxoLeve)
                                    }
                                }.padding()
                            }
                        }
                    }
                     
                }
                if(tdsStructs.count == 0){
                    VStack{
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 14).frame(width:270 , height: 60).foregroundColor(roxoEscuro)
                            Button {
                                
                                tdsStructs.append(baseStructure(title: "", corpo: "", bell: false, data: Date()))
                                
                                
                                
                                tasks.append(TaskMetaData(task: [Task(title: tdsStructs[i].title)], taskDate: tdsStructs[i].data))
                                
                                
                                if(remover == true){
                                    remover.toggle()
                                }
                                /*
                                 print(arrayTasks.tasks.count)
                                 print(arrayTasks.tasks[i])
                                 */
                                estadoModal1.toggle()
                            } label: {
                                Text("Clique aqui e comece a adicionar!").foregroundColor(.white).font(.body)
                                
                            }
                        }
                    }
                }
            }.padding()
        }
    }
}

/*
struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
*/


struct ContentView_Previews3: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

