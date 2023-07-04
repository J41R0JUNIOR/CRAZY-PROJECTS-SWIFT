//
//  Sliders.swift
//  Colors
//
//  Created by Jairo Júnior on 04/07/23.
//

import SwiftUI

struct Sliders: View {
    
    @Binding var redSlider:Double
    @Binding var greenSlider:Double
    @Binding var blueSlider:Double
    
    var body: some View {
        Slider(value: $redSlider, in: 0...1).tint(.red).padding()
        
        Slider(value: $greenSlider, in: 0...1).tint(.green).padding()
        
        Slider(value: $blueSlider, in: 0...1).padding()
    }
}


