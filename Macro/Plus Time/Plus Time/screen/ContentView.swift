//
//  ContentView.swift
//  Plus Time
//
//  Created by Jairo Júnior on 12/05/23.
//
import SwiftUI

/*
 No espaço, o que não falta é espaço
 
 */


struct ContentView: View {
    //vetor de tasks
    @State var tasks:[TaskMetaData] = []
    //@AppStorage("Tasks") var tasks:[TaskMetaData] = []
    @Environment (\ .managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var plusTimeCD:FetchedResults<PlusTimeCD>
    
    @State private var showingAddView = false
    var body: some View {
        
       
        /*
        VStack{
            
            List(plusTimeCD) { plusTime in
                Text(plusTime.title ?? "Unknown")
                

            }
            Button {
                let plusTimeCd = PlusTimeCD(context: moc)
                plusTimeCd.title = "Teste"
                
                try? moc.save()
            } label: {
                Rectangle()
            }
        }.padding()
        
        */
        
        
        
        
        
                //tabview
                
                TabView{
                    MainView(tasks: $tasks)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }.toolbar(.visible, for: .tabBar)
                        .toolbarBackground(.automatic, for: .tabBar)
                    
                    
                    
                    Home(tasks: $tasks)
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }.toolbar(.visible, for: .tabBar)
                        //.toolbarBackground( Color(.white), for: .tabBar)
                    
                }.accentColor(cinzaClaro)
            
        
    }
}



struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}


/*
    .swipeActions{
        Button {
            tdsStructs.remove(at: index)
            tasks.remove(at: index)
        } label: {
            Label("Remove", systemImage: "trash")
        }
        .tint(.red)
        ShareLink(item: "\(tdsStructs[index].title) \n \(tdsStructs[index].corpo) \n \(tdsStructs[index].data.formatted()) \n \(tdsStructs[index].secondaryVet)")
            .tint(.orange)
    }
*/
