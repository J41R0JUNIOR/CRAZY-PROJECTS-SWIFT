//
//  ContentView.swift
//  IpadGame
//
//  Created by Jairo Júnior on 24/04/23.
//
import SwiftUI


struct ContentView: View {
    @State var redSlider = 0.0
    @State var greenSlider = 0.0
    @State var blueSlider = 0.0
    
    @State var cor1 = Color(red: 0, green: 0, blue: 0)
    
    @State var red:Double = 0
    @State var green:Double = 0
    @State var blue:Double = 0
    
    @State var cor2 = Color(red: 0, green: 0, blue: 0)
    
    
    var body: some View {
        
        VStack {
            HStack{
                Rectangle().frame(width: 150, height: 150).foregroundStyle(Color(red:red, green: green, blue:blue))
                
                Rectangle().frame(width: 150, height: 150).foregroundStyle(Color(red: redSlider, green: greenSlider, blue: blueSlider))
                
            }.padding()
            
            Slider(value: $redSlider, in: 0...1).tint(.red).padding()
            
            Slider(value: $greenSlider, in: 0...1).tint(.green).padding()
            
            Slider(value: $blueSlider, in: 0...1).padding()
                
            Button {
                print(cor1)
                print(red, green, blue)
                
                red = Double.random(in: 0...1)
                green = Double.random(in: 0...1)
                blue = Double.random(in: 0...1)
                cor1 = Color(red: red, green: green, blue: blue)
            } label: {
                Text("Randomizar")
            }.buttonStyle(.borderedProminent)
            Button{
                calcular(red: red, green: green, blue: blue, redSlider:redSlider, greenSlider:greenSlider, blueSlider:blueSlider)
            } label: {
                Text("Tentativa")
            }.buttonStyle(.borderedProminent)
        }.padding()
    }
}

func calcular(red:Double, green:Double, blue:Double, redSlider:Double, greenSlider:Double, blueSlider:Double){
    
    
    var teste = 0
    
    var h:Double
    h = red - redSlider
    print(h)
    print(red)
    print(redSlider)
    
    
    if ((red - redSlider) <= 0.0000000000000050 || (red - redSlider) >= -0.0000000000000050){
        teste += 1
    }
    print(teste)
    if ((red - redSlider) <= 0000000000000050){
        teste += 1
    }
    print(teste)
    if ((green - greenSlider) <= 0000000000000050){
        teste += 1
    }
    print(teste)
    
    if redSlider == red && greenSlider == green && blueSlider == blue{
        print("Acertou na mosca!!!")
        return;
    }
    if teste == 3 {
        print("Acertou!!!")
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/*
extension UIColor {
    func euclideanDistance(to color: UIColor) -> CGFloat {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        
        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        let rDiff = r1 - r2
        let gDiff = g1 - g2
        let bDiff = b1 - b2
        
        return sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
    }
}
*/

