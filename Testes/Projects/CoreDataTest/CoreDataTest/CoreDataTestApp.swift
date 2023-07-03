//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by Jairo Júnior on 03/07/23.
//

import SwiftUI

@main
struct CoreDataTestApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
