//
//  Square.swift
//  Colors
//
//  Created by Jairo Júnior on 03/07/23.
//

import SwiftUI

struct Square: View {
    
    @Binding var red:Double
    @Binding var green:Double
    @Binding var blue:Double
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20).foregroundStyle(Color(red:red, green: green, blue:blue))
    }
}


