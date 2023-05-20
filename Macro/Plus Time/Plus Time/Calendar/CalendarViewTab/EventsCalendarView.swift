//
//  EventsCalendarView.swift
//  Plus Time
//
//  Created by Jairo Júnior on 20/05/23.
//

import SwiftUI

struct EventsCalendarView: View {
    @EnvironmentObject var eventStore: EventStore
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    var body: some View {
        NavigationStack{
            ScrollView{
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture), eventStore: eventStore, dateSelected: $dateSelected, displayEvents: $displayEvents)
            }
                .navigationTitle("Calendar View")
        }
    }
}

struct EventsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        EventsCalendarView()
        .environmentObject (EventStore (preview: true))
    }
}
