import Foundation
import SwiftUI



//Estruturas criadas pelo usuário para mostrar na tela inicial
struct baseStructure{
    var title:String
    var corpo:String
    var bell:Bool
    var data:String
    var secondaryVet:[secondStructure] = []
    
}

//Estrutura pra por dentro da estrutura
struct secondStructure{
    var title2:String
    var corpo2:String
    var data2:String
}

