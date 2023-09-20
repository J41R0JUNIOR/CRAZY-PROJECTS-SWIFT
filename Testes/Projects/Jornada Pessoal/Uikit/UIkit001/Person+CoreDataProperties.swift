//
//  Person+CoreDataProperties.swift
//  UIkit001
//
//  Created by Jairo Júnior on 19/09/23.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var date: Date?
    @NSManaged public var name: String?
    @NSManaged public var qtd: Int64

}

extension Person : Identifiable {

}
