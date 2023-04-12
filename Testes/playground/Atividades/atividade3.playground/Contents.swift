import Foundation



var megaSena:[Int] = [19,8,23,17,5,43] // 0 e 60
var lotoMania:[Int] = [19,81,90,67,54,6,34,2,45,1,4,76,8,9,24,3,67,89,54,35] // 0 e 99
var lotoFacil:[Int] = [3,1,24,12,18,13,23,5,22,10,8,2,26,17,14] // 1 e 25
var escolha:Int = 3
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
