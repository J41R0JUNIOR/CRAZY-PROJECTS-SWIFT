//
//  Specified.swift
//  TestSwiftData
//
//  Created by Jairo Júnior on 25/10/23.
//

import SwiftUI

struct Specified: View {
    @Environment(\.modelContext) private var context
    var item:DataItem
    var body: some View {
        VStack{
            Text(item.nome)
            Spacer()
        }
    }
}
