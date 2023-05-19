//
//  viewEscura.swift
//  Plus Time
//
//  Created by Jairo Júnior on 18/05/23.
//

import SwiftUI

struct viewEscura: View {
    var body: some View {
        LinearGradient(colors: [cor1, dark2],
                             startPoint: .top,
                             endPoint: .bottom)
        
    }
}

struct viewEscura_Previews: PreviewProvider {
    static var previews: some View {
        viewEscura()
    }
}
