//
//  ContentView.swift
//  iApi
//
//  Created by Jairo Júnior on 17/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var user: BringApiData?
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
            .frame(width: 120,height: 120)

            
            Text(user?.login ?? "Username")
                .bold()
                .font(.title3)
            
           
            Text(user?.bio ?? "User without Bio on GitHub")
                .padding()
            
            Spacer()
        }
        .padding()
        .task {
            do {
                user = try await getUser()
            } catch ApiError.invalidUrl{
                print("Invalid URL")
            } catch ApiError.invalidResponse{
                print("Invalid Response")
            } catch ApiError.invalidData{
                print("Invalid Data")
            } catch {
                print("Unexpected error")
            }
        }
    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


