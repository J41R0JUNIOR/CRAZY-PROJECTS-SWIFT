//
//  ContentView.swift
//  Plus Time
//
//  Created by Jairo Júnior on 12/05/23.
//
import SwiftUI




struct ContentView: View {
    @State var tasks:[TaskMetaData] = [TaskMetaData(task: [
        Task(title: "Talk to Justine"),
        Task(title: "iPhone 13 Great Design ChangeS"),
        Task(title: "Nothing Much Workout !!!")
        ], taskDate: getSampleDate(offset: 1))
    ]
    var body: some View {
        
        ZStack {
            HStack{
                TabView{
                    MainView(tasks: $tasks)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }.toolbar(.visible, for: .tabBar)
                        .toolbarBackground(
                            Color.white,
                            for: .tabBar)
                    
                    
                    
                    Home(tasks: $tasks)
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }.toolbar(.visible, for: .tabBar)
                        .toolbarBackground(
                            Color.white,
                            for: .tabBar)
                    
                }.accentColor(roxoLeve)
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

