import UIKit

var x:Int = 0

var teste: [String] = ["Teste", "Jairo"]

teste.append("Pereira")
teste.append("de")
teste.append("Sousa")
teste.append("Júnior")


let element = teste.remove(at: 0)
teste.insert(element, at: 5)

print(teste)
