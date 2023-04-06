import UIKit

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
