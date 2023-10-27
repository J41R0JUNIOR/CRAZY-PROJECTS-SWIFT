//
//  ListView.swift
//  TestSwiftData
//
//  Created by Jairo Júnior on 25/10/23.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Query private var items: [DataItem]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationView {
            List{
                ForEach(items){item in
                    NavigationLink(item.nome, destination: Specified(item: item))
                    
                }.onDelete(perform: { indexSet in
                    for index in indexSet{
                        deleteItem(items[index])
                    }
                })
//                ForEach (items) { item in
//                    VStack{
//                        HStack{
//                            Text(item.nome)
//                            Spacer()
//                        }
//                        HStack{
//                            ForEach(item.items){i in
//                                Text(i.itemName + ",")
//                            }
//                        }
//                    }
//                    
//                }.onDelete(perform: { indexSet in
//                    for index in indexSet{
//                        deleteItem(items[index])
//                    }
//                })
            }
        }
    }
    
//    func updateItem(_ item: DataItem){
//        let array = ["Shady", "Jairo", "Júnior", "The Real"]
//        item.nome = array[Int.random(in: 0...array.count - 1)]
//        try? context.save()
//    }
    
    func deleteItem(_ item: DataItem){
        context.delete(item)
    }
    
//    func addI(item: DataItem){
//        let it = DataDataItem(itemName: "TesteLouco")
//        item.items.append(it)
//        try? context.save()
//    }
}

