//
//  TestSwiftDataApp.swift
//  TestSwiftData
//
//  Created by Jairo Júnior on 24/10/23.
//

import SwiftUI
import SwiftData

@main
struct TestSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataItem.self)
    }
}
