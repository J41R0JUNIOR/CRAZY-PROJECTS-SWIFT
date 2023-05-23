//
//  Home.swift
//  Plus Time
//
//  Created by Jairo Júnior on 21/05/23.
//

import SwiftUI

struct Home: View {
    @State var currentDate: Date = Date()
    @Binding var tasks:[TaskMetaData]
    var body: some View {
        ZStack{
            viewRoxa().ignoresSafeArea()
            ScrollView( .vertical, showsIndicators: false) {
                VStack(spacing: 20){
                    CustomDatePicker (currentDate: $currentDate, tasks: $tasks)
                }
            }
        }
    }
}
/*
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
*/
