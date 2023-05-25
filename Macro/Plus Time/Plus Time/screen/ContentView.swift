//
//  ContentView.swift
//  Plus Time
//
//  Created by Jairo Júnior on 12/05/23.
//
import SwiftUI

/*
 No espaço, o que não falta é espaço
 
 */


struct ContentView: View {
    //vetor de tasks
    @State var tasks:[TaskMetaData] = []
    //@AppStorage("Tasks") var tasks:[TaskMetaData] = []
    var body: some View {
        
        
            
            
                //tabview
                
                TabView{
                    MainView(tasks: $tasks)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }.toolbar(.visible, for: .tabBar)
                        .toolbarBackground(.automatic, for: .tabBar)
                    
                    
                    
                    Home(tasks: $tasks)
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }.toolbar(.visible, for: .tabBar)
                        //.toolbarBackground( Color(.white), for: .tabBar)
                    
                }.accentColor(cinzaClaro)
            
        
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

