import UIKit

/*
var gasolina:Float = 5.80, alcool:Float = 3.20

if(alcool/gasolina) < 0.7{
    print("Abasteça com Alcool")
}else{
    print("Abasteça com Gasolina")
}
*/



/*
var pessoas:[String] = ["Jairo", "Slim Shady", "Carl Johnson"]

pessoas.sort()
pessoas.insert("Raimundo Nonato", at: 0)

if var i = pessoas.firstIndex(of: "Carl Johnsono"){
    pessoas[i] = "Cj"
}
    
let texto = pessoas.map { String($0) }.joined(separator: ", ")
print(texto)
*/



/*
let dicionarioEstudantesAcademy: [String:String] = ["619":"Jairo", "622":"Kauã", "620":"João"]

print(dicionarioEstudantesAcademy["619"])

for (chave, valor) in dicionarioEstudantesAcademy{
    print("\(chave) : \(valor)")
}
*/



/*
let atendeA = ["A001" : "Jairo", "A002" : "Eminem", "A003" : "Slash"]
let atendeP = ["P001" : "Cristiano Ronaldo", "P002" : "Lionel Messi"]

let sortedkeysA = atendeA.keys.sorted()
let sortedkeysP = atendeP.keys.sorted()

for keyP in sortedkeysP{
    print("\(keyP) : \(atendeP[keyP]!)")
}

for keyA in sortedkeysA{
    print("\(keyA) : \(atendeA[keyA]!)")
}
*/



/*
let atende = ["A001" : "Jairo", "A002" : "Eminem", "A003" : "Slash", "P001" : "Cristiano Ronaldo", "P002" : "Lionel Messi"]

let sortedkeys = atende.keys.sorted()

for key in sortedkeys{
    
    let letone = key.first
    
    if letone  == "P"{
        //print((letone)!, "<-")
        print("\(key) : \(atende[key]!)")
    }
}
for key in sortedkeys{
    let letone = key.first
    if letone  == "A"{
        //print((letone)!, "<-")
        print("\(key) : \(atende[key]!)")
    }
}
*/



/*
var numeroAleatorio = 0
var nomeCompleto = "Jairo Pereira de Sousa Júnior"

while numeroAleatorio <= 100{
    if numeroAleatorio % 10 == 0{
        print(numeroAleatorio,"-", nomeCompleto)
    }
    numeroAleatorio += 1
}
*/



/*
var inteiro: Int = 10
var decimal:Double = Double(inteiro)
print(decimal)


let texto:String = "20"
if let numero = Int(texto){
    print(numero)
    
}else{
    print("Não foi possível converter a Sting em Int.")
}
*/



/*
var texto:String = "20.0"
if let numero = Double(texto){
    print(numero)
}else{
    print("Não foi possível converter a Sting em Int.")
}
*/


/*
var nome: String?
print(nome)
nome = "Mentor"

if let nomeDesembrulhado = nome{
    print(nomeDesembrulhado)
}else{
    print("Erro ao desembrulhar.")
}
*/


/*
func soma(a:Int, b:Int) ->Int{
    return a + b
}
print(soma(a: 10, b:11))
*/



/*
let date = Date()
let calendar = Calendar.current
let component = calendar.dateComponents([.year], from:date)
let year = component.year!

func born (ano:Int) -> Int{
    
    return year - ano
}
print(born(ano: 2003))
*/



/*
func media (n1:Float, n2:Float) -> Float{
    return (n1 + n2)/2
}

if(media(n1:2, n2:8) > 7){
    print("Aprovado")
}else{
    print("Reprovado")
}
*/



/*
func imparOuPar (n:Int) ->Bool{
    if n % 2 == 0{
        return true
    }else{
        return false
    }
}
imparOuPar(n: 11) ? print("Número Par") : print("Número Ímpar")
*/


/*
 //vetor para receber os valores
var n:[Float]
 
//função onde irá calcular os valores dentro do vetor
func valores(n:[Float]) ->Float{
 //declarando as variáveis de suporte
    var i:Float = 0.0
 //variável que tem a quantidade de componentes do vetor
    var x:Float = Float(n.count)
 //variável de soma
    var soma:Float = 0
    //somando os valores
    while(i < x){
        soma += n[Int(i)]
        i+=1.0
    }
 //retornando a soma
    return soma/x
}
//variável que recebe o valor da função
var media:Float = valores(n: [10.0, 5.0, 5.5, 2.0, 10.0, 9.99])
//printando tudo
print(media)
*/



/*
//teste 1
var numeroAleatorio = 0
while numeroAleatorio <= 5{
    numeroAleatorio = Int.random(in: 1...10)
    print(numeroAleatorio)
}
//teste 2
var teste:Int = 10
let i = Float(teste)
print(i)
*/


/*
let date = Date()
let calendar = Calendar.current
let component = calendar.dateComponents([.year, .month, .day], from:date)
let year = component.year!
let month = component.month!
let day = component.day!

func born (year:Int, month:Int, day:Int) -> String{
    let born = "mm/dd/yyyy"
    return(born)
}
*/

