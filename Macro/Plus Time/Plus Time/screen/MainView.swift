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
    @FocusState var searchFocus:Bool
    @State var filtro = false
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
                                tdsStructs.append(baseStructure(title: "", corpo: "", bell: false, data: Date(), allSecVet: "\n"))
                                
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
                            Text("Save")
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
                        
                        RoundedRectangle(cornerRadius: 10).frame(width: 385, height: 40).foregroundColor(roxoAcentuado)
                        
                        HStack{
                            if(pesquisa == ""){
                                if(searchFocus == false){
                                    Button {
                                        searchFocus = true
                                        pesquisa = ""
                                    } label:{
                                        Image(systemName: "magnifyingglass").foregroundColor(roxoClaro)
                                    }
                                }
                            }
                            TextField("Search", text: $pesquisa)
                                .textFieldStyle(.roundedBorder)
                                .focused($searchFocus)
                                .foregroundColor(.white)
                                .disableAutocorrection(true)
                            
                            if(searchFocus == true){
                                Button {
                                    searchFocus = false
                                    pesquisa = ""
                                } label: {
                                    if(pesquisa == ""){
                                        Image(systemName: "chevron.down.circle")
                                    }else{
                                        Image(systemName: "xmark.circle")
                                    }
                                }

                            }
                            
                            Button {
                                filtro.toggle()
                            } label: {
                                if(filtro == false){
                                    Image(systemName: "line.3.horizontal.decrease.circle")
                                }else{
                                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                }
                            }

                            //pesquisa
                        }.padding()
                    }
                    
                    Spacer()
                    //ForEach
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
                                                    
                                                }
                                                
                                                
                                                
                                                //passando parametros pro modal
                                                .sheet(isPresented: $estadoModal1) {
                                                    ModalView(estadoModal1: $estadoModal1, indice: i, title: $tdsStructs[i].title, notes: $tdsStructs[i].corpo, data: $tdsStructs[i].data, bell: $tdsStructs[i].bell, secondaryVet: $tdsStructs[i].secondaryVet, tasks: $tasks, allSecVet: $tdsStructs[i].allSecVet)
                                                }
                                            }
                                            //Divider().background(roxoLeve)
                                        }
                                    }.padding()
                                    .contextMenu {
                                        ShareLink(item: "\(tdsStructs[index2].title) \n \(tdsStructs[index2].corpo) \n \(tdsStructs[index2].data.formatted()) \n \(tdsStructs[index2].allSecVet)")
                                    }
                                }
                            }
                        }
                    }
                    else if(filtro == true){
                        ForEach (tdsStructs.indices, id: \.self){index3 in
                            if(tdsStructs[index3].bell == true){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15).foregroundColor(roxoEscuro)
                                    
                                    HStack{
                                        if(remover == true){
                                            Button {
                                                tdsStructs.remove(at: index3)
                                                tasks.remove(at: index3)
                                                
                                                
                                            } label: {
                                                Image(systemName: "trash.slash.circle.fill").font(.system(size:25)).foregroundColor(.red)
                                            }
                                        }
                                        
                                        //botao do sino
                                        Button {
                                            tdsStructs[index3].bell.toggle()
                                        } label: {
                                            if(tdsStructs[index3].bell == true){
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
                                                    i = index3
                                                    if(remover == true){
                                                        remover.toggle()
                                                    }
                                                } label: {
                                                    VStack{
                                                        HStack{
                                                            if(tdsStructs[index3].title == ""){
                                                                Text("Add Título").fontWeight(.bold).foregroundColor(.primary)
                                                            }
                                                            Text(tdsStructs[index3].title).fontWeight(.bold).foregroundColor(.primary).lineLimit(1)
                                                                .allowsTightening(false)
                                                            Spacer()
                                                        }
                                                        HStack{
                                                            if(tdsStructs[index3].corpo == ""){
                                                                Text("Add Body").font(.system(size: 13)).foregroundColor(.secondary)
                                                            }
                                                            Text(tdsStructs[index3].corpo).font(.system(size: 13)).foregroundColor(.secondary).lineLimit(2)
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
                                                    ModalEntrar(estadoModal2: $estadoModal2, estadoModal1: $estadoModal1, index: index3, secondaryVet: $tdsStructs[i].secondaryVet, title: $tdsStructs[i].title, notes: $tdsStructs[i].corpo, data: $tdsStructs[i].data, bell: $tdsStructs[i].bell, tasks: $tasks)
                                                }
                                                
                                                
                                                
                                                //entrar no modal de edição
                                                Button{
                                                    estadoModal1.toggle()
                                                    i = index3
                                                } label: {
                                                    
                                                    //Text("Comming...")
                                                    Text(tdsStructs[index3].data.formatted()).foregroundColor(.primary)
                                                    //corpo da estrutura
                                                    
                                                }
                                                
                                                
                                                
                                                //passando parametros pro modal
                                                .sheet(isPresented: $estadoModal1) {
                                                    ModalView(estadoModal1: $estadoModal1, indice: i, title: $tdsStructs[i].title, notes: $tdsStructs[i].corpo, data: $tdsStructs[i].data, bell: $tdsStructs[i].bell, secondaryVet: $tdsStructs[i].secondaryVet, tasks: $tasks, allSecVet: $tdsStructs[i].allSecVet)
                                                }
                                            }
                                            //Divider().background(roxoLeve)
                                        }
                                    }.padding()
                                    .contextMenu {
                                        ShareLink(item: "\(tdsStructs[index3].title) \n \(tdsStructs[index3].corpo) \n \(tdsStructs[index3].data.formatted()) \n \(tdsStructs[index3].allSecVet)")
                                    }
                                }
                            }
                        }
                    }
                    else{
                        
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
                                                
                                            }
                                            
                                            
                                            
                                            //passando parametros pro modal
                                            .sheet(isPresented: $estadoModal1) {
                                                ModalView(estadoModal1: $estadoModal1, indice: i, title: $tdsStructs[i].title, notes: $tdsStructs[i].corpo, data: $tdsStructs[i].data, bell: $tdsStructs[i].bell, secondaryVet: $tdsStructs[i].secondaryVet, tasks: $tasks, allSecVet: $tdsStructs[i].allSecVet)
                                            }
                                        }
                                        //Divider().background(roxoLeve)
                                    }
                                }.padding()
                                    .contextMenu {
                                        ShareLink(item: "\(tdsStructs[index].title) \n \(tdsStructs[index].corpo) \n \(tdsStructs[index].data.formatted()) \n \(tdsStructs[index].allSecVet)")
                                    }
                            }
                            
                        }
                    }
                     
                }
                if(tdsStructs.count == 0){
                    VStack{
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 14).frame(width:270 , height: 60).foregroundColor(roxoEscuro)
                            Button {
                                
                                tdsStructs.append(baseStructure(title: "", corpo: "", bell: false, data: Date(), allSecVet: "\n"))
                                
                                
                                
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

/*
ShareLink(item: "\(tdsStructs[index].title) \n \(tdsStructs[index].corpo) \n \(tdsStructs[index].data.formatted())")
*/
