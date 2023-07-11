//
//  PlusTimeApp.swift
//  PlusTime
//
//  Created by Jairo Júnior on 07/06/23.
//

import SwiftUI

@main
struct PlusTimeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
