//
//  TabView.swift
//  Scrow
//
//  Created by Jairo Júnior on 18/04/23.
//

import SwiftUI

struct TabView2: View {
    var body: some View {
        VStack {
            
            TabView{
                RedView()
                    .tabItem {
                        Label("RED", systemImage: "paintbrush")
                    }
                BlueView()
                    .tabItem {
                        Label("BLUE", systemImage: "paintbrush")
                    }
                GreenView()
                    .tabItem {
                        Label("GREEN", systemImage: "paintbrush")
                    }
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView2()
    }
}

struct RedView_Previews: PreviewProvider {
    static var previews: some View {
        RedView()
    }
}

struct RedView: View {
    var body: some View {
        
        Color(.red)
    }
}

struct BlueView : View{
    var body: some View{
        Color(.blue)
    }
}

struct GreenView : View{
    var body: some View{
        Color(.green)
    }
}
