//
//  detalhesView.swift
//  FinalChallenge
//
//  Created by Jairo Júnior on 20/04/23.
//

import SwiftUI





struct detalhesView: View {
    
    var body: some View {
        ScrollView{
            VStack{
                Image("Image")
                Text("A Volkswagen é uma fabricante alemã de veículos que pertence ao Grupo Volkswagen. É o maior fabricante de automóveis do mundo e tem a sua sede na cidade de Wolfsburg, na Baixa Saxônia.")
            }
        }.padding()
    }
}

struct detalhesView_Previews: PreviewProvider {
    static var previews: some View {
        detalhesView()
    }
}

struct detalhesView1: View {
    var body: some View {
        ScrollView{
            VStack{
                Image("Image 1")
                Text("Dr. Ing. h.c. F. Porsche AG, geralmente abreviado para Porsche AG, ou somente Porsche, é uma das principais marcas de automóveis esportivos do mundo, criada na Áustria e, hoje, sediada em Stuttgart, Alemanha.")
            }
        }.padding()
    }
}

struct detalhesView2: View {
    var body: some View {
        ScrollView{
            VStack{
                Image("Image 2")
                Text("Toyota Motor Corporation é um fabricante automotivo japonês com sede na Toyota, província de Aichi, no Japão. Em março de 2014, a corporação multinacional era composta por 338 875 funcionários em todo o mundo e, em fevereiro de 2016, era a 13.ª maior empresa do mundo por receita.")
            }
        }.padding()
    }
}
