
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Meu Perfil")
            Divider().frame(minHeight: 4).background(Color.blue)
            Spacer()
            HStack {
                Text("Hello, world!")
                Spacer()
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
