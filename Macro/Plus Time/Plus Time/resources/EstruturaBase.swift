import Foundation
import SwiftUI



//Estruturas criadas pelo usuário para mostrar na tela inicial
struct baseStructure{
    var title:String
    var corpo:String
    var bell:Bool
    var data:Date
    var secondaryVet:[secondStructure] = []
    var allSecVet:[String] = []
    var idCD:UUID
}

//Estrutura pra por dentro da estrutura
struct secondStructure{
    var title2:String
    var corpo2:String
    var data2:Date
    
}

