//
//  ContentView.swift
//  iApi Sudoku
//
//  Created by Jairo Júnior on 18/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sudoku: BringInfo?
    @State private var jogo:[[Int]]?
    var body: some View {
        ScrollView{
            VStack {
                Button {
                    Task{
                        do {
                            sudoku = try await newBoard()
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
                }label: {
                    Text("Generate")
                }.buttonStyle(.borderedProminent)
                
                
                Text("Message: \(sudoku?.newboard.message ?? "None message")")
                
                Text("Results: \(sudoku?.newboard.results ?? 0)")
                
                Text("Dificuldade: \(sudoku?.newboard.grids[0].difficulty ?? "nothig")")
                
                ForEach(sudoku?.newboard.grids ?? [], id: \.difficulty) { grid in
                    // Display the Sudoku grid values
                    Text("Sudoku")
                    VStack {
                        ForEach(grid.value, id: \.self) { row in
                            HStack {
                                ForEach(row, id: \.self) { cellValue in
                                    Text("\(cellValue)")
                                        .frame(width: 30, height: 30)
                                        .border(Color.black)
                                }
                            }
                        }
                    }
                    
                    Spacer(minLength: CGFloat(100))
                    Text("Solution")
                    
                    Spacer()
                    // Display the Sudoku solution
                    VStack {
                        ForEach(grid.solution, id: \.self) { row in
                            HStack {
                                ForEach(row, id: \.self) { cellValue in
                                    Text("\(cellValue)")
                                        .frame(width: 30, height: 30)
                                        .border(Color.black)
                                }
                            }
                        }
                    }
                }
                
                
                
                
                
                
                
                
                
            }
        }
        .padding()
      
        .task {
            do {
                sudoku = try await newBoard()
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
