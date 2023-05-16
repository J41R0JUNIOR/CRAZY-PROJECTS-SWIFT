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
                    }
                    CalendarView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                }.accentColor(.white)
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
