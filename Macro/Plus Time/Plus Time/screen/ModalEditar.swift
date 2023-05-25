//modal de add eventos/tarefas
import SwiftUI



struct ModalView: View{
    
    
    
    //variaveis
    @Binding var estadoModal1:Bool
    var indice:Int
    @Binding var title:String
    @Binding var notes:String
    @Binding var data:Date
    @Binding var bell:Bool
    @Binding var secondaryVet:[secondStructure]
    @State var remover = false
    @Binding var tasks:[TaskMetaData]
    @State var i:Int = 0
    @State var j:Int = 0
    
    
    //@State private var datePicked = Date()
    
   
    
    var body: some View{
        ZStack{
            //plano de fundo
            //viewRoxa().ignoresSafeArea()
            
            VStack{
                HStack{
                    
                    
                    
                    //fechar modal
                    Button {
                        estadoModal1.toggle()
                        if(remover == true){
                            remover.toggle()
                        }
                        
                        if (tasks[indice].task[0].title != title){
                            tasks[indice].task[0].title = title
                        }
                        if (tasks[indice].taskDate != data){
                            tasks[indice].taskDate = data
                        }
                        
                        print(tasks[indice].task[i].title)
                        /*
                        while (i < tasks.count){
                            
                            if(tasks[indice].taskDate == tasks[i].taskDate && indice != i){
                                print("achoo que peguei um tuelho")
                                tasks[i].task.append(Task(title: tasks[indice].task[0].title))
                            }
                           // if(tasks)
                            i+=1
                        }
                            
                        */
                        
                    } label: {
                        Text("Done").foregroundColor(roxoAcentuado)
                    }.padding(.horizontal)
                    Spacer()
                    
                    
                    
                    //add
                    Image(systemName: "square.and.pencil").font(.system(size: 20)).foregroundColor(roxoAcentuado)
                    
                    .contextMenu {
                        
                        Button {
                            secondaryVet.append(secondStructure(title2: "", corpo2: "", data2: Date()))
                            if(remover == true){
                                remover.toggle()
                            }
                        } label: {
                            Label("Adicionar", systemImage: "square.and.pencil")
                            Image(systemName: "square.and.pencil").font(.system(size: 20)).foregroundColor(roxoAcentuado)
                        }
                        //aparecer botao de remover as células
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
                
                
                    
                    //sino
                    HStack{
                        Button {
                            bell.toggle()
                        } label: {
                            if(bell == true){
                                Image(systemName:"bell.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(roxoAcentuado)
                            }else{
                                Image(systemName:"bell")
                                    .font(.system(size: 20))
                                    .foregroundColor(roxoAcentuado)
                            }
                        }
                        
                    }.foregroundColor(.white)
                    
                    HStack{
                        Form{
                            Section(header: Text("Primary")){
                                
                                TextField("Digite o Título", text: $title)
                                    .disableAutocorrection(true)
                                    .textFieldStyle(.plain)
                                    .foregroundColor(roxoAcentuado)
                                    .font(.system(size: 20))
                                if(notes == ""){
                                    Text("Digite a Atividade Abaixo")
                                }
                                TextEditor(text: $notes)
                                    .font(.custom("HelveticaNeue", size: 15)).font(.body)
                                    .lineLimit(1).disableAutocorrection(true)
                                    .allowsTightening(false).cornerRadius(5)
                                
                                DatePicker("", selection: $data, in: Date()...)
                                    .foregroundColor(roxoClaro)
                                
                            }
                            Section(header: Text("Added")){
                                
                                ForEach(secondaryVet.indices, id: \.self) { vet in
                                    
                                    TextField("Título", text: $secondaryVet[vet].title2 ).font(.custom("Title", size: 20))
                                        .textFieldStyle(.plain)
                                        .foregroundColor(roxoAcentuado)
                                    if(secondaryVet[vet].corpo2 == ""){
                                        Text("Digite a Atividade Abaixo")
                                    }
                                    
                                    TextEditor(text: $secondaryVet[vet].corpo2)
                                        .font(.custom("HelveticaNeue", size: 15))
                                        .font(.body)
                                        
                                    DatePicker("", selection: $secondaryVet[vet].data2, in: Date()..., displayedComponents: .date)
                                        .foregroundColor(roxoClaro)
                                    
                                    if(remover == true){
                                        Button {
                                            secondaryVet.remove(at: vet)
                                        } label: {
                                            Image(systemName: "trash.slash.circle.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(roxo)
                                        }
                                       
                                    }
                                    
                                    
                                }
                            }
                        }
                        
                        /*
                        ScrollView{
                            VStack{
                                
                                    
                                
                                
                                
                                //Text("\(title) [\(index)]")
                                
                                
                                HStack{
                                    Spacer()
                                    
                                    
                                    //TextField("Data:", text: $data).frame(width: 100).disableAutocorrection(true).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                                }.padding(.horizontal)
                            }.padding()
                            ForEach(secondaryVet.indices, id: \.self) { vet in
                                ZStack{
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
                                        TextField("Título", text: $secondaryVet[vet].title2 ).textFieldStyle(.roundedBorder).foregroundColor(roxoAcentuado)
                                        
                                        
                                        
                                        TextEditor(text: $secondaryVet[vet].corpo2)
                                            .font(.custom("HelveticaNeue", size: 15)).font(.body)
                                            .frame(width: 360, height: 80, alignment: .leading)
                                        
                                        HStack{
                                            Spacer()
                                            DatePicker("", selection: $secondaryVet[vet].data2, in: Date()..., displayedComponents: .date).foregroundColor(roxoClaro)
                                            
                                        }
                                    }.padding()
                                }.padding()
                            }
                        }
                        */
                    }
                
                
                
                Spacer()
            }.padding(.vertical)
        }
    }
}



struct ContentView_Previews2: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
