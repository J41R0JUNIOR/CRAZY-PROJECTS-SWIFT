//
//  Person+CoreDataProperties.swift
//  UIkit001
//
//  Created by Jairo Júnior on 20/09/23.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var tasks: NSSet?

}

// MARK: G/Users/jairojunior/Documents/GitHub/CRAZY-PROJECTS-SWIFT/Testes/Projects/Jornada Pessoal/Uikit/UIkit001/UIkit001/UIkit001.entitlementsenerated accessors for tasks
extension Person {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Task)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Task)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}

extension Person : Identifiable {

}
