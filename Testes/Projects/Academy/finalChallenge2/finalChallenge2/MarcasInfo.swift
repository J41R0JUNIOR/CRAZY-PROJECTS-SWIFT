//
//  MarcasInfo.swift
//  finalChallenge2
//
//  Created by Jairo Júnior on 22/04/23.
//

import SwiftUI

struct MarcasInfo: View {
    @Binding var star:Bool
    var marca: String
    var imagem: Image
    
    var body: some View {
        Text(imagem)
        Text(marca)
    }
}


struct MarcasInfo_Previews: PreviewProvider {
    static var previews: some View {
        MarcasInfo(star: tdsMarcas[n].$star, marca: tdsMarcas[n].marcas, imagem: tdsMarcas[n].imagem)
    }
}
