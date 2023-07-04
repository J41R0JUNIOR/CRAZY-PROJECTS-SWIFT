//
//  PlayerSquare.swift
//  Colors
//
//  Created by Jairo Júnior on 03/07/23.
//

import SwiftUI

struct PlayerSquare: View {
    
    @Binding var redSlider:Double
    @Binding var greenSlider:Double
    @Binding var blueSlider:Double
    
    
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20).foregroundStyle(Color(red: redSlider, green: greenSlider, blue: blueSlider))
        
    }
}


