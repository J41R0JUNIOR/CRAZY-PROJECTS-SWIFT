//
//  DataContainer.swift
//  AppChat
//
//  Created by Jairo Júnior on 05/11/23.
//

import Foundation
import SwiftData

@Model
class Message{
//    @Attribute(.unique) var id: String = ""
    var text: String = ""
    
    init(text: String) {
//        self.id = UUID().uuidString
        self.text = text
    }
}
