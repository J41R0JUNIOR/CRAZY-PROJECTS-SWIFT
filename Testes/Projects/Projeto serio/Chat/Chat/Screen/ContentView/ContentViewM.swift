//
//  ContentViewM.swift
//  Chat
//
//  Created by Jairo Júnior on 01/11/23.
//

import Foundation
import SwiftUI

struct ContentViewM{    
    @StateObject var cloudKit = CloudKitUserBootcampViewModel()
    @Environment(\.modelContext) var context
    
}
