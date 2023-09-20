//
//  TestCD001App.swift
//  TestCD001
//
//  Created by Jairo Júnior on 15/08/23.
//

import SwiftUI

 @main
struct TestCD001App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.persistentCloudKitContainer.viewContext)
        }
    }
}
