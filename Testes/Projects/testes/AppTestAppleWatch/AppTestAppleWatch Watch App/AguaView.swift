//
//  AguaView.swift
//  AppTestAppleWatch Watch App
//
//  Created by Jairo Júnior on 02/05/24.
//

import SwiftUI

struct AguaView: View {
    @State var grupo = ["agua", "de", "coco"]
    @State var isPresented = false
    var body: some View {
        List{
            ForEach(grupo, id: \.self){item in
                NavigationLink(value: NavigationEnumCoordinator.view2(texto: .constant(item))) {
                    Text(item)
                }
            }
        }
        
    }
}

#Preview {
    AguaView()
}
