//
//  ContentView2.swift
//  Chat
//
//  Created by Jairo Júnior on 09/11/23.
//

import SwiftUI
import CloudKit

class viewModel: ObservableObject{
    @Published var text: String = ""
    @Published var messages: [String] = []
    
    init(){
        fetchItens()
    }
    
    func addItem(){
        guard !text.isEmpty else {return}
        addItem(text: text)
    }
    
    func addItem(text: String){
        print(text)
        let newMessage = CKRecord(recordType: "Messages")
        newMessage["text"] = text
        saveItem(record: newMessage)
    }
    
    func saveItem(record: CKRecord){
        CKContainer.default().publicCloudDatabase.save(record) { returnedRecord, returnedError in
            print("Record: \(returnedRecord)")
            print("Error: \(returnedError)")
        }
    }
    
    func fetchItens(){
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Messages", predicate: predicate)
        let queryOperation = CKQueryOperation(query: query)
        
        var returnedValues:[String] = []
        addOperation(operation: queryOperation)
      
        queryOperation.recordMatchedBlock = { (returnedRecordId, returnedResult) in
            switch returnedResult {
            case .success(let record):
                guard let text = record["text"] as? String else { return }
                returnedValues.append(text)
                break
            case .failure(let error):
                print("Error \(error)")
                break
            }
        }
        
        queryOperation.queryResultBlock = { [weak self] returnedResult in
            print("Returned results: \(returnedResult)")
            self?.messages = returnedValues
        }
    }
    
    func addOperation(operation: CKDatabaseOperation){
        CKContainer.default().publicCloudDatabase.add(operation)

    }
}

struct ContentView2: View {
    @StateObject var vm = viewModel()
    @StateObject var not = PushNotificationCloudKitViewModel()
    
    var body: some View {
        VStack{
            HStack{
                HStack{
                    Button("Request"){
                        not.requestNotificationPermission()
                    }
                    .buttonStyle(.borderedProminent)
                    Button("Subscribe"){
                        not.subscribeToNotifications()
                    }
                    .buttonStyle(.borderedProminent)
                    Button("Ubsubscribe"){
                        not.unSubscribeToNotifications()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            Spacer()
            TextField("Add message", text: $vm.text)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    vm.addItem()
                    vm.text = ""
                }
            List{
                ForEach(vm.messages, id: \.self){
                    Text($0)
                }
            }.listStyle(.automatic)
        }
        
    }
}

#Preview {
    ContentView2()
}
