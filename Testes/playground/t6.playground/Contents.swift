import UIKit

var name:String = "Jairo Pereira de Sousa Júnior"
let sname = name.split(separator: " ")
var firstName = sname[0], lastName = sname.last!, midName = sname[1]

if midName == "da" || midName == "e" || midName == "de"{
    midName = sname[2]
}

var totName:String = ("\(lastName) \(firstName.first!). \(midName.first!).").uppercased()
let totName2 = totName.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ".", with: "")
var arrName:[Character] = [" "]

for n in totName2{
    arrName.append(n)
}

arrName.remove(at: 0)
arrName.reverse()

var finalName:String = " "
for s in arrName{
    finalName.append(s)
}

var finalName2 = finalName.replacingOccurrences(of: "A", with: "65").replacingOccurrences(of: "E", with: "69").replacingOccurrences(of: "I", with: "73").replacingOccurrences(of: "O", with: "79").replacingOccurrences(of: "U", with: "85").replacingOccurrences(of: "Ú", with: "85").replacingOccurrences(of: " ", with: "")

print("Desafio 1")
print(totName)
print("Desafio 2")
print(totName2)
print(finalName2)
