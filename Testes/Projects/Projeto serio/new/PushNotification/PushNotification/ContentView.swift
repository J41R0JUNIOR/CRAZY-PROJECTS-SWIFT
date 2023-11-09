//
//  ContentView.swift
//  PushNotification
//
//  Created by Jairo Júnior on 08/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = CloudKitSetting()
    
    var body: some View {
        VStack {
            Text("IS SIGNED IN: \(vm.isSignedToiCloud.description)")
           
            Text("PERMISSION: \(vm.permissionStatus.description)")
            
            Text("NAME: \(vm.userName.description)")
            
            Text("ERROR: \(vm.error.description)")
        }
    }
}

#Preview {
    ContentView()
}
