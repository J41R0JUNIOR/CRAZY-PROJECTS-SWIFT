//
//  ContentView.swift
//  Plus Time
//
//  Created by Jairo Júnior on 12/05/23.
//
import SwiftUI
import UIKit

var red = 0
var green = 0
var blue = 0



//cores
let cor1 = Color(red:93/255, green: 31/255, blue:221/255)
let cor2 = Color(red:98/255, green: 84/255, blue:253/255)
let cor3 = Color(red:238/255, green: 224/255, blue:255/255)

let dark = Color(red:36/255, green: 36/255, blue:36/255)


struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            HStack{
                TabView{
                    View1()
                    .tabItem {
                        Label("Menu", systemImage: "house")
                    }
                    View2()
                    .tabItem {
                        Label("Calendário", systemImage: "calendar")
                    }
                }.accentColor(.white)
            }
        }
    }
}
