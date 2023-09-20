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

    @NSManaged public var nomeTask: String?
    @NSManaged public var dataTask: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var person: Person?

}

extension Task : Identifiable {

}
