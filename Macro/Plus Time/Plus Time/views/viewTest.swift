//
//  viewTest.swift
//  Plus Time
//
//  Created by Jairo Júnior on 18/05/23.
//

import SwiftUI

struct viewTest: View {
    var body: some View {
        LinearGradient(colors: [dark, cor1],
                             startPoint: .top,
                             endPoint: .bottom)
    }
}

struct viewTest_Previews: PreviewProvider {
    static var previews: some View {
        viewTest()
    }
}
