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
    @FocusState private var t1Focused: Bool
    @FocusState private var n1Focused: Bool
    @FocusState private var t2Focused: Bool
    @FocusState private var n2Focused: Bool
    @Binding var allSecVet:[String]
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
                       
                                                
                    } label: {
                        Text("Done").foregroundColor(roxo)
                    }.padding(.horizontal)
                    Spacer()
                    
                    
                    
                    //add
                    if(remover == false){
                        
                        
                        Menu(content: {
                            Button {
                                secondaryVet.append(secondStructure(title2: "", corpo2: "", data2: Date()))
                                if(remover == true){
                                    remover.toggle()
                                }
                            } label: {
                                Label("Add", systemImage: "square.and.pencil")
                                Image(systemName: "square.and.pencil").font(.system(size: 20)).foregroundColor(roxo)
                            }
                            //aparecer botao de remover as células
                            Button {
                                remover.toggle()
                            }label: {
                                if(remover == false){
                                    Label("Remove", systemImage: "trash.slash")
                                }else{
                                    Label("Done", systemImage: "return")
                                }
                                
                            }
                        }, label: {
                            Image(systemName: "square.and.pencil").font(.system(size: 20))
                                .foregroundColor(roxo)
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
                        
                        
                }.padding(.horizontal)
                
                
                    
                    //sino
                    HStack{
                        Button {
                            bell.toggle()
                        } label: {
                            if(bell == true){
                                Image(systemName:"bell.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(roxo)
                            }else{
                                Image(systemName:"bell")
                                    .font(.system(size: 20))
                                    .foregroundColor(roxo)
                            }
                        }
                        
                    }.foregroundColor(.white)
                    
                    HStack{
                        Form{
                            Section(header: Text("Primary")){
                                HStack{
                                    TextField("Add Title", text: $title)
                                        .disableAutocorrection(true)
                                        .textFieldStyle(.plain)
                                        .foregroundColor(roxo)
                                        .font(.system(size: 20))
                                        .focused($t1Focused)
                                        
                                    
                                    if (t1Focused == true){
                                        if(title != ""){
                                            Button {
                                                t1Focused = false
                                            } label: {
                                                Image(systemName: "chevron.down.circle").font(.system(size: 15))
                                            }

                                        }
                                    }
                                }
                                
                                HStack{
                                    ZStack{
                                        
                                        if(notes == ""){
                                            if(n1Focused == false){
                                                HStack{
                                                    Text("Type the activity").foregroundColor(.gray)
                                                    Spacer()
                                                }
                                            }
                                        }
                                        TextEditor(text: $notes)
                                            .font(.custom("HelveticaNeue", size: 15)).font(.body)
                                            .lineLimit(1)
                                            .disableAutocorrection(true)
                                            .allowsTightening(false).cornerRadius(5)
                                            .focused($n1Focused)
                                            .navigationTitle("Activity")
                                    }
                                    if(n1Focused == true){
                                        if(notes != ""){
                                            Button {
                                                n1Focused = false
                                            } label: {
                                                Image(systemName: "chevron.down.circle").font(.system(size: 15))
                                            }
                                        }
                                    }
                                }
                                
                                DatePicker("", selection: $data, in: Date()...)
                                    .foregroundColor(.white)
                                
                            }
                            Section(header: Text("Added")){
                                
                                ForEach(secondaryVet.indices, id: \.self) { vet in
                                    
                                    if(remover == true){
                                        Button {
                                            secondaryVet.remove(at: vet)
                                        } label: {
                                            Image(systemName: "trash.slash.circle.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(.red)
                                        }
                                        
                                    }
                                    HStack{
                                        TextField("Add Title", text: $secondaryVet[vet].title2 ).font(.custom("Title", size: 20))
                                            .textFieldStyle(.plain)
                                            .foregroundColor(roxo)
                                            .disableAutocorrection(true)
                                            .focused($t2Focused)
                                        
                                        if(t2Focused == true){
                                            if(secondaryVet[vet].title2 != ""){
                                                Button {
                                                    t2Focused = false
                                                } label: {
                                                    Image(systemName: "chevron.down.circle").font(.system(size: 15))
                                                }
                                            }
                                        }
                                    }
                                    if(secondaryVet[vet].corpo2 == ""){
                                        HStack{
                                            Text("Type the activity below").foregroundColor(.gray)
                                            Spacer()
                                        }
                                    }
                                    HStack{
                                        
                                        TextEditor(text: $secondaryVet[vet].corpo2)
                                            .font(.custom("HelveticaNeue", size: 15))
                                            .font(.body).disableAutocorrection(true)
                                            .focused($n2Focused)
                                        
                                        if(n2Focused == true){
                                            if(secondaryVet[vet].corpo2 != ""){
                                                Button {
                                                    n2Focused = false
                                                } label: {
                                                    Image(systemName: "chevron.down.circle").font(.system(size: 15))
                                                }
                                            }
                                        }
                                    }
                                    DatePicker("", selection: $secondaryVet[vet].data2, in: Date()...)
                                        .foregroundColor(.white)
                                    
                                    
                                    
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
