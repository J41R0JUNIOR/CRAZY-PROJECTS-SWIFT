//
//  ContentView.swift
//  Budget
//
//  Created by Jairo Júnior on 09/01/24.
//

import SwiftUI

struct ContentView: View {
//    let h: CGFloat = 200
//    let w: CGFloat = 50
    @State var value1: Double = 190
    @State var value2: Double = 0
    
    @State var h:CGFloat = 300
    @State var w:CGFloat = 75
    @State var mult:Double = 0.7
    
    var body: some View {
        VStack {
            HStack{
                    Button(action: {
                        value1 = Double.random(in: 0...100)
                        value2 = Double.random(in: 0...100)
                        
                        value1 *= 2
                        value2 *= 2
                    }, label: {
                        ZStack{
                            
                            CustomCircle(startAngle: .degrees(0), endAngle: .degrees(300), clockWise: false)
                                .stroke(.gray, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                .frame(width: h, height: h)
                            
                            HStack{
                                CustomRectangle(y: value1)
                                    .frame(width: w * mult, height: h * mult)
                                    .foregroundColor(.red)
                                //                    .border(.black, width: 3)
                                CustomRectangle(y: value2)
                                    .frame(width: w * mult, height: h * mult)
                                    .foregroundColor(.blue)
                                //                    .border(.black, width: 3)
                            }
                        }
                    })
                
                    
                
//                ZStack{
//                    
//                    
//                    CustomRectangle(y: 0)
//                        .frame(width: w, height: h)
//                        .foregroundColor(.clear)
//                        .border(.black, width: 3)
//                    
//                    CustomRectangle(y: 100)
//                        .frame(width: w * 0.87 , height: h * 0.98)
//                        .foregroundColor(.red)
//                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
