
import SwiftUI
import SwiftData

struct ListView: View {
    @Query private var items: [Msg]
    @StateObject var m = ListViewM()
    @StateObject var cloudKit = CloudKitUserBootcampViewModel()
    @Environment(\.modelContext)  var context
    @Environment (\.dismiss) var dismiss
    @Environment(\.colorScheme) var isDarkMode

    var body: some View {
        VStack{
            List{
                ForEach(items)  { mensagem in
                    HStack{
                        Text(mensagem.mensagem )
                            .foregroundColor(isDarkMode == .dark ? .white : .black)
                        Spacer()
                        Text(((mensagem.user == cloudKit.userName ? "" : mensagem.user) ) )
                            .foregroundColor(isDarkMode == .dark ? .white : .black)
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet{
                        deleteItem(items[index])
                    }
                })
            }
            .listStyle(.plain)
        }
    }
    
    func deleteItem(_ item: Msg){
        context.delete(item)
    }
}
