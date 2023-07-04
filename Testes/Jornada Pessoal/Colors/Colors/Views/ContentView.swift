import SwiftUI

struct ContentView: View {
    @State var redSlider:Double = 0.0
    @State var greenSlider:Double = 0.0
    @State var blueSlider:Double = 0.0
    
    
    
    @State var red:Double = 0
    @State var green:Double = 0
    @State var blue:Double = 0
    
    
    
    var body: some View {
        VStack {
            HStack{
                Square(red: $red, green: $green, blue: $blue).frame(width: 180, height: 150)
                
                PlayerSquare(redSlider: $redSlider, greenSlider: $greenSlider, blueSlider: $blueSlider).frame(width: 180, height: 150)
            }
            
            Spacer()
            Sliders(redSlider: $redSlider, greenSlider: $greenSlider, blueSlider: $blueSlider)
            
            
            Bottons(redSlider: $redSlider, greenSlider: $greenSlider, blueSlider: $blueSlider, red: $red, green: $green, blue: $blue)
            
            Spacer()
            Score()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
