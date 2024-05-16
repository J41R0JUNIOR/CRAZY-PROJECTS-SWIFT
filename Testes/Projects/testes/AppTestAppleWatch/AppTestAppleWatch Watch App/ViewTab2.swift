//
//  ViewTab2.swift
//  AppTestAppleWatch Watch App
//
//  Created by Jairo Júnior on 03/05/24.
//

import SwiftUI

struct ViewTab2: View {
    @Binding var grupo: [String]
 

    var body: some View {
        VStack{
            Text("opa")
            List{
                ForEach($grupo, id: \.self){indice in
                    NavigationModal(.sheet, value: NavigationEnumCoordinator.view2(texto: indice), data: NavigationEnumCoordinator.self) {
                        Text(indice.wrappedValue)
                    }
                    
                }
            }
        }
        
        
    }
}

#Preview {
    ViewTab2(grupo: .constant(["agua", "de", "coco"]))
}
