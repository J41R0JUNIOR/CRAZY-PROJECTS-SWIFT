//
//  AppChatApp.swift
//  AppChat
//
//  Created by Jairo Júnior on 05/11/23.
//

import SwiftUI
import SwiftData

@main
struct AppChatApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Message.self)
    }
}
