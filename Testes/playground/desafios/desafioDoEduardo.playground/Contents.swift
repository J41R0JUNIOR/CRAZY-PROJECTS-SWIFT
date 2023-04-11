import UIKit
//Declarando as Variáveis da primeira parte
var name:String = "Jairo Pereira de Sousa Júnior"
let sname = name.split(separator: " ")
var firstName = sname[0], lastName = sname.last!, midName = sname[1]
//eliminando o da, e, de
if midName == "da" || midName == "e" || midName == "de"{
    midName = sname[2]
}
//declarando variáveis para formatar como o pedido
var totName:String = ("\(lastName) \(firstName.first!). \(midName.first!).").uppercased()
//tirando os espaços e os pontos
let totName2 = totName.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ".", with: "")
//vetor para receber todos os caracteres
var arrName:[Character] = [" "]
//passando todos os caracteres para o vetor anterior
for n in totName2{
    arrName.append(n)
}
//retirando a posição 0 que nada mais é que um espaço que tive que por para conseguir declarar o vetor
arrName.remove(at: 0)
//invertendo todo o vetor criado
arrName.reverse()
//Iniciando a segunda parte e criando mais um vetor para a segunda parte
var finalName:String = " "
//colocando tudo no vetor criado anteriormente
for s in arrName{
    finalName.append(s)
}
//Trocando as vogais para os seus respectivos números na tabela Ascii
var finalName2 = finalName.replacingOccurrences(of: "A", with: "65").replacingOccurrences(of: "E", with: "69").replacingOccurrences(of: "I", with: "73").replacingOccurrences(of: "O", with: "79").replacingOccurrences(of: "U", with: "85").replacingOccurrences(of: "Ú", with: "85").replacingOccurrences(of: " ", with: "")
//Printando tudo
print("Desafio 1")
print(totName)
print("Desafio 2")
print(totName2)
print(finalName2)
