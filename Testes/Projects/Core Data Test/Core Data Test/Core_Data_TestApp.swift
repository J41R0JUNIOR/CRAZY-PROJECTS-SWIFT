//
//  Core_Data_TestApp.swift
//  Core Data Test
//
//  Created by Jairo Júnior on 03/07/23.
//

import SwiftUI

@main
struct Core_Data_TestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
