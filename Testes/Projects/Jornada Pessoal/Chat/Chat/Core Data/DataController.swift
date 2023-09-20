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
        
        description.cloudKitContainerOptions?.databaseScope = .public

    }
    
    
    func saveData(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved!!!")
        }catch{
            print("We could not save the data...")
        }
    }
    
    func addMensagem(mensagem: String, context: NSManagedObjectContext){
        let ChatMensagem = Msg(context: context)
        ChatMensagem.mensagem = mensagem
        ChatMensagem.date = Date()
        ChatMensagem.id = UUID()
        
        saveData(context: context)
    }
    
}