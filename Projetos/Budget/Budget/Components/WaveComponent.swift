//
//  WaveComponent.swift
//  Budget
//
//  Created by Jairo Júnior on 11/02/24.
//

import SwiftUI

struct WaveComponent: View {
    @Binding var frequency: Double 
    @Binding var strength: Double
    @Binding var phase: Double
    
    var min: Double
    var max: Double
    
    var body: some View {
        ZStack{
            ForEach(0..<2){ i in
                Wave(strength: self.strength, frequency: self.frequency, phase: self.phase)
                    .stroke(Color.purple.opacity(Double(i) / 20), lineWidth: 5)
                    .offset(y: CGFloat(i) * 10)
            }
        }
    }
}

#Preview {
    ContentView()
}
