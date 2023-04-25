//
//  ContentView.swift
//  finalChallenge2
//
//  Created by Jairo Júnior on 20/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Views(star: tdsMarcas[n].star)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
