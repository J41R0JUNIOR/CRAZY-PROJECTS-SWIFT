//
//  DataDataItem.swift
//  TestSwiftData
//
//  Created by Jairo Júnior on 25/10/23.
//

import Foundation
import SwiftData

@Model
class DataDataItem{
    var itemName: String
    init(itemName: String) {
        self.itemName = itemName
    }
}
