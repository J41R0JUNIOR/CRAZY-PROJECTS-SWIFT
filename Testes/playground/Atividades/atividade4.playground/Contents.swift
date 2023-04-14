import UIKit
/*
class Carro{
    
    var marca:String
    var modelo:String
    var comnustivel:String
    var potencia:String
    var ano:Int
    
    init (marca:String, modelo:String, combustivel:String, potencia:String, ano:Int){
        self.marca = marca
        self.modelo = modelo
        self.comnustivel = combustivel
        self.potencia = potencia
        self.ano = ano
    }
    
    func ligar(){
        print("Carro ligado")
    }
    
    func acelerar(){
        print("Acelerando o carro")
    }
    
    func frear(){
        print("Freando o carro")
    }
    
}

let carro1 = Carro(marca: "VW", modelo: "Gol", combustivel: "Gasolina", potencia: "120", ano: 2013)
let carro2 = Carro(marca: "Toyota", modelo: "Corolla", combustivel: "Flex", potencia: "190 Cv", ano: 2023)

carro1.ligar()
carro2.ligar()
var modelo1 = carro1.modelo
print(modelo1)
var modelo2 = carro2.modelo
print(modelo2)
*/
/*
class Animal{
    
    var nome:String
    var cor:String
    var forca:String
    var raca:String
    var velocidade:String
    
    init(nome:String, cor:String, forca:String, raca:String, velocidade:String){
        self.nome = nome
        self.cor = cor
        self.forca = forca
        self.raca = raca
        self.velocidade = velocidade
    }
    
    func acordar(){
        print("Tá saindo da jaula o MOOOONSTRO")
    }
    func andar(){
        print("O animal está andando")
    }
    
}

let cachorro = Animal(nome: "Ghost", cor: "Preto", forca: "5000N", raca: "Rottweiller", velocidade: "100Km/h")

let gato = Animal(nome: "Ellie", cor: "Breanca", forca: "1N", raca: "Siamês", velocidade: "50Km/h")

let animal1 = gato.nome
let animal2 = cachorro.nome
print("animal 1 = \(animal1)\nanimal 2 = \(animal2)")
*/



/*
class Alunos{
    var nome:String
    var idade:Int
    var comidasPrediletas:[String]
    
    func apresentacaoDoAluno(){
        print("Olá meu nome é \(nome)")
    }
    func felizAniversario(){
        print("Idade nova \(idade + 1)")
    }
    func adicionarComidaPredileta(){
        var comidasPrediletas = "Pizza"
        print(comidasPrediletas)
    }
    func imprimeIdade(){
        print("Idade \(idade)")
    }
    func imprimeComidasPrediletas(){
        var i = 0
        print("Comidas Prediletas: ")
        while(i < (comidasPrediletas.count)){
            print(comidasPrediletas[i])
            i+=1
        }
    }
    init (nome:String, idade:Int, comidasPrediletas:[String]){
        self.nome = nome
        self.idade = idade
        self.comidasPrediletas = comidasPrediletas
    }
}
let aluno1 = Alunos(nome: "Slim", idade: 20, comidasPrediletas: ["Sushi", "Macarrão"])
aluno1.apresentacaoDoAluno()
aluno1.felizAniversario()
aluno1.imprimeIdade()
aluno1.imprimeComidasPrediletas()
 print("\n")
 //aluno 2
 let aluno2 = Alunos(nome: "Drácula", idade: 500, comidasPrediletas: ["Sangue", "Alho"])
 aluno2.apresentacaoDoAluno()
 aluno2.felizAniversario()
 aluno2.imprimeIdade()
 aluno2.imprimeComidasPrediletas()
*/



/*
class Cliente{
    var nome:String
    var cpf:String
    var nconta:ContaBancaria?
    init(nome:String, cpf:String){
        self.nome = nome
        self.cpf = cpf
    }
}

class ContaBancaria{
    var nconta:Int
    var cliente:Cliente
    var saldo:Float = 0.0
    init(nconta:Int, cliente:Cliente, saldo:Float){
        self.nconta = nconta
        self.cliente = cliente
        self.saldo = saldo
    }
    
    func getconta(){
        print(saldo)
    }
}

class Transacoes{
    var conta:ContaBancaria
    
    init(saldo:ContaBancaria, conta:ContaBancaria){
        self.conta = conta
    }
    
    func sacar(valor:Float){
        conta.saldo -= valor
    }
    func depositar(valor:Float){
        conta.saldo += valor
    }
}
*/



