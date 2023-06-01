//
//  DataController.swift
//  Plus Time
//
//  Created by Jairo Júnior on 29/05/23.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm" )

    init() {
        container.loadPersistentStores { descriptoin, error in
            if let error = error {
                print( "Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}


