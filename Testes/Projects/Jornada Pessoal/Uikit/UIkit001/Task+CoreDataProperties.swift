//
//  Task+CoreDataProperties.swift
//  UIkit001
//
//  Created by Jairo Júnior on 20/09/23.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var dataTask: Date?
    @NSManaged public var idTask: UUID?
    @NSManaged public var nomeTask: String?
    @NSManaged public var person: Person?
    
    public var wrappedNameTask:String{
        nomeTask ?? "Unknown Task"
    }
    public var wrappedIdTask:UUID{
        idTask ?? UUID()
    }
    public var wrappedDataTask:Date{
        dataTask ?? Date()
    }
    

}

extension Task : Identifiable {

}
