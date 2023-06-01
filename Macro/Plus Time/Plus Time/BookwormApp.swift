//
//  BookwormApp.swift
//  Plus Time
//
//  Created by Jairo Júnior on 29/05/23.
//

import Foundation
import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}




struct ContentView_Previews6: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
