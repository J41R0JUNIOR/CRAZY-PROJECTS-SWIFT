//
//  Event.swift
//  Plus Time
//
//  Created by Jairo Júnior on 20/05/23.
//

import Foundation
import SwiftUI

struct Event: Identifiable {
    
    enum EventType: String, Identifiable, CaseIterable {
        case work, home, social, sport, unspecified
        var id: String {
            self.rawValue
        }
        
        var icon: String {
            switch self {
            case .work:
                return "🔴" case .home:
                return "🔴" case .social:
                return "🔴" case .sport:
                return "🔴" case .unspecified:
                return "📌"
            }
        }
    }
    
    var eventType: EventType
    var date: Date
    var note: String
    var id: String
    
    init(eventType: EventType, date: Date, note: String, id: String) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
    }
    
    static var sampleEvents: [Event] {
        
        @State var arrayOfEvents : [Event] = []
        
        return arrayOfEvents
    }
}
/*
Event (eventType: .home, date: Date().diff(numDays: 7), note: "Take dog to groomers", id: "1"),
Event (eventType: .home, date: Date().diff(numDays: -3), note: "File tax returns.", id: "2"),
Event (eventType:.social, date: Date().diff(numDays: 4), note: "Dinner party at Dave and Janet's", id: "3"),
Event (eventType:.work, date: Date().diff(numDays: 5), note: "Complete Audit.", id: "4"),
Event (eventType: .sport, date: Date().diff(numDays: 6), note: "Football Game", id: "5")
*/
