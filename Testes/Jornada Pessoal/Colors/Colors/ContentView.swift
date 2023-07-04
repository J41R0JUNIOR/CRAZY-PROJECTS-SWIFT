//
//  ContentView.swift
//  Colors
//
//  Created by Jairo Júnior on 03/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Square().frame(width: 100, height: 100)
            PlayerSquare().frame(width: 100, height: 100)
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
