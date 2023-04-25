//
//  Views.swift
//  finalChallenge2
//
//  Created by Jairo Júnior on 20/04/23.
//

import SwiftUI
var n:Int = 0

struct Views: View {
    
    @State var star:Bool = true
    var body: some View {
        NavigationView{
            VStack{
                
                ForEach(0..<qtd, id: \.self) { n in
                    HStack{
                        NavigationLink{
                            MarcasInfo(star: tdsMarcas[n].$star, marca: tdsMarcas[n].marcas, imagem: tdsMarcas[n].imagem)
                        }label: {
                            Text(tdsMarcas[n].imagem)
                        }
                        Button {
                            print(tdsMarcas[n].marcas)
                            tdsMarcas[n].star.toggle()
                            print(tdsMarcas[n].star)
                        } label: {
                            if tdsMarcas[n].star == false{
                                Image(systemName: "star")
                            }else{
                                Image(systemName: "star.fill")
                            }
                        }
                    }
                }
                
            }
        }
    }
}
    
struct Views_Previews: PreviewProvider {
    static var previews: some View {
        Views()
    }
}

struct Marcas{
    var marcas:String
    var imagem:Image
    @Binding var star:Bool
    //
    init(marcas: String, imagem: Image, star: Bool) {
        self.marcas = marcas
        self.imagem = imagem
        self.star = star
    }
}

var tdsMarcas = [Marcas(marcas: "Volkswagen", imagem: Image("Image"), star: false),
                 Marcas(marcas: "Porche", imagem: Image("Image 1"), star: false),
                 Marcas(marcas: "Toyota", imagem: Image("Image 2"), star: false)]
//let id1 = Marcas(marcas: "Volkswagen")

var qtd = tdsMarcas.count
