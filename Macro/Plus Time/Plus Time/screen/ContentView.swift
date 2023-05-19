//
//  ContentView.swift
//  Plus Time
//
//  Created by Jairo Júnior on 12/05/23.
//
import SwiftUI
import UIKit




struct ContentView: View {
    //vetor contendo as estruturas
    
    var body: some View {
        
        ZStack {
            HStack{
                TabView{
                    MainView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }.toolbar(.visible, for: .tabBar)
                        .toolbarBackground(
                            Color.white,
                            for: .tabBar)
                    CalendarView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }.toolbar(.visible, for: .tabBar)
                        .toolbarBackground(
                            Color.white,
                            for: .tabBar)
                }.accentColor(cor3)
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
