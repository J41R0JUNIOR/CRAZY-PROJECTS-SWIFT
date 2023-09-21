//
//  DataController.swift
//  Chat
//
//  Created by Jairo Júnior on 31/08/23.
//

import Foundation
import CoreData
import CloudKit
//import SwiftUI

class DataController:ObservableObject{
    let persistentCloudKitContainer : NSPersistentCloudKitContainer

    init(){
        persistentCloudKitContainer = NSPersistentCloudKitContainer(name: "DataModel")
        
        persistentCloudKitContainer.loadPersistentStores{ desc, error in
            if let error = error{
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
        guard let description = persistentCloudKitContainer.persistentStoreDescriptions.first else{
            fatalError("Failed to initialize persistant container")
        }
        
        description.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
        description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        description.cloudKitContainerOptions?.databaseScope = .public
        
        persistentCloudKitContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        persistentCloudKitContainer.viewContext.automaticallyMergesChangesFromParent = true
        
    }
    
    
    func saveData(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved!!!")
        }catch{
            print("We could not save the data...")
        }
    }
    
    func addPerson(name: String, context: NSManagedObjectContext){
        let person = Person(context: context)
        person.name = name
        person.date = Date()
        
        saveData(context: context)
    }
    
    func addTask(nameTask:String, contextTask:NSManagedObjectContext, personTask:Person){
        // Crie uma nova tarefa associada à pessoa
        let task = Task(context: contextTask)
        task.nomeTask = nameTask
        task.dataTask = Date()
        task.person = personTask
        
        // Salve a tarefa no contexto
        DataController().saveData(context: contextTask)
    }
    
}
