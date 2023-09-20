//
//  DemoCoreApp.swift
//  DemoCore
//
//  Created by Jairo Júnior on 13/08/23.
//

import SwiftUI

@main
struct DemoCoreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
