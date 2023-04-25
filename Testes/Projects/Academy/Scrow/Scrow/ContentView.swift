import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink {
                    TabView2()
                } label: {
                    Text("NavigationView")
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 25).frame(width: 150, height: 50).foregroundColor(.red)
                    Button("Teste de botão"){
                        print("Cara, esse botão não tem funcionalidade!!!")
                    }
                }
                
                ScrollView{
                    ForEach (1..<30, id: \.self){ numero in
                        HStack{
                            Spacer()
                            
                            VStack {
                                Image("Image").frame(width: 100, height: 100).clipShape(RoundedRectangle(cornerRadius: 15))
                                Text("Imagem 1")
                            }
                            Spacer()
                            VStack {
                                Image("Image 1").frame(width: 100, height: 100).clipShape(RoundedRectangle(cornerRadius: 15))
                                Text("Imagem 2")
                            }
                            Spacer()
                        }
                        
                    }
                }
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


