import UIKit

//Desafio 1
/*
var megaSena:[Int] = [19,8,23,17,5,43] // 0 e 60
var lotoMania:[Int] = [19,81,90,67,54,6,34,2,45,1,4,76,8,9,24,3,67,89,54,35] // 0 e 99
var lotoFacil:[Int] = [3,1,24,12,18,13,23,5,22,10,8,2,26,17,14] // 1 e 25
var escolha:Int = 1
var qtd:Int = 0
var numeroAleatorio:[Int] = []
var i:Int = 0

if escolha == 1{

    //randomizar os números para o vetor
    while(i <= 6){
        numeroAleatorio.append(Int.random(in: 1...60))
        i+=1
    }
    var j = 0
    var k = j + 1
    //verificar se tem iguais
    while(j < 6){
        while(k < 6){
            if(numeroAleatorio[j] == numeroAleatorio[k]){
                print("Peguei um Tuelho")
                numeroAleatorio[j] = Int.random(in: 1...60)
            }
            k+=1
        }
        j+=1
    }
    //Verificar a quantidade de acertos
    var t = 0
    while(t < 6){
        if(numeroAleatorio[t] == megaSena[t]){
            qtd += 1
        }
        t+=1
    }
}else if escolha == 2{
    //randomizar os números para o vetor
    while(i <= 20){
        numeroAleatorio.append(Int.random(in: 0...99))
        i+=1
    }
    var j = 0
    var k = j + 1
    //verificar se tem iguais
    while(j < 20){
        while(k < 20){
            if(numeroAleatorio[j] == numeroAleatorio[k]){
                print("Peguei um Tuelho")
                numeroAleatorio[j] = Int.random(in: 0...99)
            }
            k+=1
        }
        j+=1
    }
    //Verificar a quantidade de acertos
    var t = 0
    while(t < 20){
        if(numeroAleatorio[t] == lotoMania[t]){
            qtd += 1
        }
        t+=1
    }
}else if escolha == 3{
    //randomizar os números para o vetor
    while(i <= 15){
        numeroAleatorio.append(Int.random(in: 1...25))
        i+=1
    }
    var j = 0
    var k = j + 1
    //verificar se tem iguais
    while(j < 15){
        while(k < 15){
            if(numeroAleatorio[j] == numeroAleatorio[k]){
                print("Peguei um Tuelho")
                numeroAleatorio[j] = Int.random(in: 1...25)
            }
            k+=1
        }
        j+=1
    }
    //Verificar a quantidade de acertos
    var t = 0
    while(t < 15){
        if(numeroAleatorio[t] == lotoFacil[t]){
            qtd += 1
        }
        t+=1
    }
}
print("qtd",qtd)
*/


//Desafio 2
/*
var escolha:String = "Papel"
let objetos = ["Pedra", "Papel", "Tesoura"]
let pcEscolha:String = objetos.randomElement()!


if(pcEscolha == "Pedra" && escolha == "Papel"){
  print("Papel vence pedra, você ganhou!!!")
}
else if(pcEscolha == "Papel" && escolha == "Pedra"){
  print("Papel vence pedra, pc ganhou!!!")
}
else if(pcEscolha == "Tesoura" && escolha == "Pedra"){
  print("Pedra vence tesoura, você ganhou!!!")
}
else if(pcEscolha == "Pedra" && escolha == "Tesoura"){
  print("Pedra vence tesoura, pc ganhou!!!")
}
else if(pcEscolha == "Papel" && escolha == "Tesoura"){
  print("Tesoura vence papel, você ganhou!!!")
}
else if(pcEscolha == "Tesoura" && escolha == "Papel"){
  print("Tesoura vence papel, pc ganhou!!!")
}
else{
  print("Deu empate")
}
*/



//Desafio 3
/*
var tentativa:[Int] = [1,5,3,7] // 0 a 9
var acertos:Int = 0
var senha:[Int] = []
var i:Int = 0
  //randomizar os números para o vetor
  while(i < 5){
      senha.append(Int.random(in: 0...9))
      i+=1
  }
  //Verificar a quantidade de acertos
  var t = 0
  for s in tentativa{
    if(senha[t] == s){
      acertos += 1
      print(s, "- posição[\(t)]")
    }
    t+=1
  }
print(senha)
*/
//Desafio 3


/*
let password = (senhaAleatoria())
let tentativa:[Int] = [0,3,9,1]
print(compararEmString(password: password, tentativa: tentativa))


func compararEmString(password:[Int], tentativa:[Int]) -> String{
    let stringArray1 = password.map{String($0)}
    let stringArray2 = tentativa.map{String($0)}
    var i = 0
    var qtd = 0
    if(stringArray1 == stringArray2){
        return "Iguais"
    }
    while(i < 4){
        if(stringArray1[i] == stringArray2[i]){
            qtd+=1
        }
        i+=1
    }
    return "\(qtd) na posição correta"
}



func senhaAleatoria () ->[Int]{
    var senha:[Int] = []
    var i = 0
    
    while(i < 4){
        senha.append(Int.random(in: 0...9))
        i+=1
    }
    return senha
}
*/

//Desafio 4

/*
//Declarando os valores a ser calculado
var base:String = "5.5"
var altura:String = "5.4"

//printando a poha toda
print(areaTriangulo(base: base, altura: altura))
*/

/*
 FUNÇÃO PEDIDA NO DESAFIO:
 
 Escreva uma função que calcule a área de um triângulo retângulo. A função deve receber dois parâmetros, representando a base e a altura do triângulo, ambos como strings opcionais. Se um dos parâmetros não for fornecido, a função deve retornar nil. Além disso, a função deve verificar se os parâmetros fornecidos são valores numéricos. Se não forem, a função deve retornar nil. Por fim, a função deve imprimir o resultado da área calculada se tudo estiver correto, ou imprimir uma mensagem de erro caso contrário.
 */
/*
func areaTriangulo (base:String?, altura:String?) -> String{
    //variável que vai guardar o valor da área do triângulo
    var areaTriangulo:Float = 0.0
    //analisando se consegui passar todos os parâmetros
    if let a = Float(altura) , if let b = Float(base){
        
            areaTriangulo = (b * a)/2
          
            return "\(areaTriangulo)"
    }

    }else{
        return "Erro"
    }
    
    if(base == nil || altura == nil){
        return "nil"
    }
    
    return "nil"
}

*/
