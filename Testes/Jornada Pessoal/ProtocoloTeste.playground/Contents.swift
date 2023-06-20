import UIKit

/*

var greeting = "Hello, playground"

protocol Animal {
    var species: String { get }
    var canFly: Bool { get }
}

protocol Flyable {
    var maximumSpeed: Double { get }
}

struct Macaw: Animal, Flyable{
    var species: String = "Anodorhynchus leari"
    var canFly: Bool = true
    var maximumSpeed: Double
}

struct Monkey: Animal{
    var species: String = "Sapajus apella"
    var canFly: Bool = false
}
*/


/*
print(teste)

protocol jairo{
    var inteligente: Bool { get }
    var fera: Bool { get }
}

struct Caio: jairo{
    var inteligente: Bool = true
    var fera: Bool = false
}
*/

/*
class matador{
    func matar(){
        print("Fala do personagem:")
    }
}

class Jason:matador{
    var mascara:Bool
    var motosserra:Bool
    
    init(mascara:Bool, motosserra:Bool){
        self.mascara = mascara
        self.motosserra = motosserra
    }
    
    override func matar(){
        if(mascara == true){
            print("E o Jason com sua icônica máscara")
        }else{
            print("E o Jason sem sua icônica máscara")
        }
        
        if(motosserra == true){
            print("e com sua motosserra")
        }else{
            print("e sem sua motosserra")
        }
        print("Disse:")
        print("Cuidado com a cabeça!")
    }
}


var criador = Jason(mascara: false, motosserra: false)
print(criador.matar())
*/

class bancoJr{
    var conta:UUID
    var saldo:Float
    var nome:String
    
    init(conta:UUID, saldo:Float, nome:String){
        self.conta = conta
        self.saldo = saldo
        self.nome = nome
    }
}

class usuario: bancoJr{
    override init(conta: UUID, saldo: Float, nome: String) {
        super.init(conta: UUID(), saldo: Float(), nome: String())
    }
}

