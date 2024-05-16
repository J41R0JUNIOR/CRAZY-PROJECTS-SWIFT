//
//  EnumCoordinaton.swift
//  AppTestAppleWatch Watch App
//
//  Created by Jairo Júnior on 03/05/24.
//

import SwiftUI

enum NavigationEnumCoordinator: View{
//    case home
    case viewTab2(group: Binding<[String]>)
    case view2(texto: Binding<String>)
    
    var body: some View {
        
        switch self {
//        case .home:
//            HomeView()
            
        case .viewTab2(let group):
            ViewTab2(grupo: group)
        case .view2(let texto):
            View2(texto: texto)
        }
    }
}


extension NavigationEnumCoordinator: Equatable, Hashable{
    func hash(into hasher: inout Hasher) {
        
        switch self {
//        case .home:
//            hasher.combine("home")
            
        case let .viewTab2(group: group):
            hasher.combine("group\(group)")
        case .view2:
            hasher.combine("config")
        }
    }
    
    
//    func hash(into hasher: inout Hasher) {

//        hasher.combine(self.hashValue)
//    }
    
    
    
    static func == (lhs: NavigationEnumCoordinator, rhs: NavigationEnumCoordinator) -> Bool {
        
        return lhs.hashValue == rhs.hashValue
    }
    
//    static func == (lhs: NavigationCoordinator, rhs: NavigationCoordinator) -> Bool {
//
//        switch (lhs, rhs){
//        case (.home, .home):
//            return true
//
//        case let (.group(group: group1), .group(group: group2)):
//            return group1.wrappedValue == group2.wrappedValue
//
//        default:
//            return true
//        }
//    }
}
