//
//  Score.swift
//  Colors
//
//  Created by Jairo Júnior on 04/07/23.
//

import SwiftUI

struct Score: View {
    @Binding var score:Int
    
    
    var body: some View {
        VStack{
            Button {
                score = 0
                UserDefaults.standard.set(score, forKey: "Data")
            } label: {
                Text("Score")
                Text("\(score)")
            }

        }
    }
}
