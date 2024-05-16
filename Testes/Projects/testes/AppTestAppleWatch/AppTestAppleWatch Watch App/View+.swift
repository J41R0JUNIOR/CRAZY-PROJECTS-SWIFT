
import SwiftUI

extension View {
    func navigationLinkValues<D>(_ data: D.Type) -> some View where D: Hashable & View{
        NavigationStack{
          self.navigationDestination(for: NavigationEnumCoordinator.self, destination: { $0 })
        }
    }
  
    @ViewBuilder
    func `if` <Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        }else{
            self
        }
    }
}
