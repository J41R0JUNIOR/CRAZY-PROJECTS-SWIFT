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
class killer{
    func matar(){
        print("Fala do personagem:")
    }
}

class Jason:killer{
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


/*
class bancoJr{
    var conta:UUID
    var saldo:Float
    
    init(conta:UUID, saldo:Float){
        self.conta = conta
        self.saldo = saldo
    }
}
class tansacao{
    var idInicial:UUID
    var idFinal:UUID
    var transacao:Float
    
    init(idInicial:UUID, idFinal:UUID, transacao:Float){
        self.idInicial = idInicial
        self.idFinal = idFinal
        self.transacao = transacao
    }
    
    func passar(user1:UUID, user2:UUID){
        
    }
}

class usuario: bancoJr{
    var nome:String
    var idUser:UUID
    init(nome:String, idUser:UUID){
        self.nome = nome
        self.idUser = idUser
        super.init(conta: UUID(), saldo: 0)
    }
}
*/

/*
protocol acoes1{
    func turbo()
}
protocol acoes2{
    func som()
}

class Veiculo{
    var modelo:String
    var qtdRodas:Int
    var combustivel:String
    
    init(modelo:String, qtdRodas:Int, combustivel:String){
        self.modelo = modelo
        self.qtdRodas = qtdRodas
        self.combustivel = combustivel
    }
    
     func acelerar() {
        print("acelerando")
    }
    
     func frear() {
        print("freando")
    }
}

class Carga:Veiculo, acoes1{
    func turbo() {
        print("Tiuuuuuuu")
    }
    
    override func acelerar() {
        print("vrummmmmm")
    }
    
    override func frear() {
        print("uuuuuuuuuts")
    }
}

class CarroPasseio:Veiculo, acoes2{
    func som() {
        print("Negro Drama, entre o sucesso e a lama...")
    }
    override func acelerar() {
        print("vrum vrum")
    }
    
    override func frear() {
        print("tshhh")
    }
}


var onibus = Carga(modelo: "Mercedão", qtdRodas: 6, combustivel: "Diesel")
print(onibus.acelerar())
print(onibus.frear())
print(onibus.turbo())

var fuscaoPreto = CarroPasseio(modelo: "Fusca", qtdRodas: 4, combustivel: "Gasolina")
print(fuscaoPreto.acelerar())
print(fuscaoPreto.frear())
print(fuscaoPreto.som())
*/


class Estudante{
    var nome:String
    var matricula:String{
        return "(UC)"
    }
    
    init(nome:String, matricula:String){
        self.nome = nome
    }
    
    func falar(){
        print("Queria tanto ser do Academy 😢")
    }
}
class Academigo:Estudante{
    override var matricula: String{
        return "KIT"
    }
    
    override func falar(){
        print("Pera, você não é do Academy??? 🤢🤮")
    }
}

var alegre = Academigo(nome: "jairo", matricula: "")
print(alegre.matricula)
print(alegre.nome)
print(alegre.falar())

print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")

var triste = Estudante(nome: "junior", matricula: "")
print(triste.matricula)
print(triste.nome)
print(triste.falar())
