//
//  MeshComponent.swift
//  Budget
//
//  Created by Jairo Júnior on 13/02/24.
//

import SwiftUI

struct MeshComponent: View {
    let w:CGFloat = 250
    let h:CGFloat = 250
    var body: some View {
        ZStack{
            CheckeredMesh().stroke(Color.black, style: .init(lineWidth: 3))
            GraphicInMesh().stroke(Color.red, style: .init(lineWidth: 3))
            
        }.frame(width: w, height: h)
    }
}


#Preview {
    ContentView()
}
