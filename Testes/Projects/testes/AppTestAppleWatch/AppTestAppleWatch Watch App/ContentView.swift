//
//  ContentView.swift
//  AppTestAppleWatch Watch App
//
//  Created by Jairo Júnior on 02/05/24.
//

import SwiftUI

struct ContentView: View {
//    @State var i:Selector

    var body: some View {
        VStack {
            
            TabView{
                AguaView()
                   
                BallView()
                
                
                ViewTab2(grupo: .constant(["funk and roll","coco", "black metal", "rap universitário"]))
                  
                    
            }.navigationLinkValues(NavigationEnumCoordinator.self)
                
                
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
