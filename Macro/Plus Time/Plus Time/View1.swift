//
//  View1.swift
//  Plus Time
//
//  Created by Jairo Júnior on 12/05/23.
//

import SwiftUI
 
struct View1: View {
    var numViews:Int = 10
    var body: some View {
        ZStack {
            Color(red:98/255, green: 84/255, blue:253/255).ignoresSafeArea()
            
            //Color(cor2).ignoresSafeArea()
            VStack{
                Text("+Time").foregroundColor(cor3).font(.system(size:40))
                //Cor de fundo da ScrollView
                ZStack{
                    RoundedRectangle(cornerRadius: 15).foregroundColor(dark).frame(width: 385)
                    
                    //ScrollView dos horários
                    ScrollView {
                        ForEach (1..<numViews, id: \.self){ numero in
                            HStack{
                                Button {
                                    
                                    print("Foi")
                                } label: {
                                    Image(systemName:
                                            "bell.fill").font(.system(size: 20)).foregroundColor(.red)
                                }

                                
                                
                                VStack{
                                    HStack{
                                        Text("Título").fontWeight(.bold).foregroundColor(.white).lineLimit(1)
                                            .allowsTightening(false)
                                        Spacer()
                                        
                                    }
                                    HStack{
                                        Text("Caso a pessoa digite mais do que eu defini, ela não consegue ultapassar. Digitando só pra testar a minha teoria").font(.system(size: 15)).foregroundColor(cor3).lineLimit(2)
                                            .allowsTightening(false)
                                        Spacer()
                                        Text("20/02 >").fontWeight(.bold).foregroundColor(cor3)
                                        
                                    }
                                    Divider().background(cor3)
                                }
                            }.padding()
                            //Divider().background(Color.white)
                            
                        }
                    }
                }
            }.padding()
        }
    }
}

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
