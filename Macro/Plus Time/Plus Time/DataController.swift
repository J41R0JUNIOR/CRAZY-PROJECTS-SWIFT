//
//  DataController.swift
//  Plus Time
//
//  Created by Jairo Júnior on 29/05/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm" )

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print( "Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved!!!")
        }catch{
            print("Data not saved!!!")
        }
    }
    func addTasks(title: String, body: String, data: Date, bell: Bool, context: NSManagedObjectContext){
        let task = PlusTimeCD(context: context)
        task.id = UUID()
        task.bell = bell
        task.title = title
        task.body = body
        task.data = data

        save(context:context)
    }
    func edit(task: PlusTimeCD ){
        
    }
}


