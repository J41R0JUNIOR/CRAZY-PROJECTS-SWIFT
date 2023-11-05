//
//  ChatApp.swift
//  Chat
//
//  Created by Jairo Júnior on 25/08/23.
//

import SwiftUI
import SwiftData

@main
struct ChatApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Msg.self)
    }
}
