import CoreData
import Foundation

class DataController: ObservableObject{
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
        description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
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
    
    func addPersonagem(nome: String, peso: Double, idade: Int16, dataAdd: Date, context: NSManagedObjectContext){
        let character = Personagem(context: context)
        character.id = UUID()
        character.nome = nome
        character.peso = peso
        character.idade = idade
        character.dataAdd = Date()
        
        saveData(context: context)
    }
    
    func editPersonagem(character:Personagem, nome: String, peso: Double, idade: Int16, context: NSManagedObjectContext){
        character.nome = nome
        character.peso = peso
        character.idade = idade
        
        saveData(context: context)

    }
}

