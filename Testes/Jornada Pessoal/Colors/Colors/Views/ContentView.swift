import SwiftUI

struct ContentView: View {
    @State var redSlider:Double = 0.5
    @State var greenSlider:Double = 0.5
    @State var blueSlider:Double = 0.5
    
    @State var red:Double = 0
    @State var green:Double = 0
    @State var blue:Double = 0
    
    @State var pontos:Int = 0
    @State var inicio = 0
    @State var tentativas = 0
    @State var maiorPontuacao = 0

    @State var score:Int = UserDefaults.standard.integer(forKey: "Data")
    
    var body: some View {
        
        
        if tentativas != 4{
            VStack {
                Text("COLORS").bold().font(.system(size: 30))
                Spacer()
                
                Pontos(pontos: $pontos, inicio: $inicio, tentativas: $tentativas)
                
                Spacer()
                HStack{
                    Square(red: $red, green: $green, blue: $blue).frame(width: 185, height: 150)
                    
                    
                    
                    PlayerSquare(redSlider: $redSlider, greenSlider: $greenSlider, blueSlider: $blueSlider).frame(width: 185, height: 150)
                }
                
                Spacer()
                Sliders(redSlider: $redSlider, greenSlider: $greenSlider, blueSlider: $blueSlider)
                
                
                Bottons(redSlider: $redSlider, greenSlider: $greenSlider, blueSlider: $blueSlider, red: $red, green: $green, blue: $blue, score: $score, inicio: $inicio, pontos: $pontos, tentativas: $tentativas, maiorPontuacao: $maiorPontuacao)
                
                Spacer()
                Score(score: $score)
                
            }
            .padding()
        }
        else{
            TryAgain(tentativas: $tentativas, maiorPontuacao: $maiorPontuacao, pontos: $pontos)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
