//
//  View2.swift
//  AppTestAppleWatch Watch App
//
//  Created by Jairo Júnior on 02/05/24.
//

import SwiftUI

struct View2: View {
    @Binding var texto: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
//            Text(texto)
            Button(texto, action: {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .background(.blue)
        
        
//        .toolbar{
//            ToolbarItem(placement: .topBarLeading) {
//                Button("Back", action: {
//                    self.presentationMode.wrappedValue.dismiss()
//                })
//                .foregroundStyle(.white)
//            }
//        }
       
    }
}

#Preview {
    View2(texto: .constant("Anime"))
}
