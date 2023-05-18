//
//  ModalEditar.swift
//  Plus Time
//
//  Created by Jairo Júnior on 17/05/23.
//

import SwiftUI

struct ModalEntrar: View {
    @Binding var estadoModal2:Bool
    @Binding var estadoModal1:Bool
    var index:Int
    var body: some View {
        ZStack{
            Color(red:36/255, green: 36/255, blue:36/255).ignoresSafeArea()
            VStack{
                VStack{
                    HStack{
                        
                        
                        
                        //fechar o modal
                        Button {
                            estadoModal2.toggle()
                        } label: {
                            Text("Done")
                        }
                        Spacer()
                        
                        
                        
                        //editar
                        Button {
                            print("edit")
                            estadoModal2.toggle()
                            estadoModal1.toggle()
                        } label: {
                            Text("Edit").foregroundColor(.blue)
                        }
                        
                        
                    }.padding()
                    ZStack{
                        
                        
                        
                        //Corpo do modal
                        RoundedRectangle(cornerRadius: 10).frame(width: 358, height: 150).foregroundColor(dark2)
                        HStack{
                            
                        }
                    }.padding()
                }
                Spacer()
            }
        }
    }
}
