//
//  ContentView.swift
//  Budget
//
//  Created by Jairo Júnior on 09/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Budget(value1: $viewModel.value1, value2: $viewModel.value2, h: $viewModel.h)
          
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
