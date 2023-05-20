//
//  ContentView.swift
//  Plus Time
//
//  Created by Jairo Júnior on 12/05/23.
//
import SwiftUI





struct ContentView: View {
    //vetor contendo as estruturas
    @EnvironmentObject var eventStore: EventStore
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
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
                    ScrollView{
                        CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture), eventStore: eventStore, dateSelected: $dateSelected, displayEvents: $displayEvents)
                    }
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
            .environmentObject (EventStore (preview: true))
    }
}
