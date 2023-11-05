//
//  DataController.swift
//  TestSwiftData
//
//  Created by Jairo Júnior on 24/10/23.
//

import SwiftUI
import Foundation
import SwiftData

@Model
class DataItem{
    @Attribute(.unique) var id: String
    var nome: String
    @Relationship(deleteRule: .cascade) var items = [DataDataItem]()
    
    init(nome: String) {
        self.id = UUID().uuidString
        self.nome = nome
    }
}
