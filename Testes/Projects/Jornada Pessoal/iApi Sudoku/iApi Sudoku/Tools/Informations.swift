//
//  Informations.swift
//  iApi Sudoku
//
//  Created by Jairo Júnior on 18/08/23.
//

import Foundation

struct BringInfo: Codable {
    let newboard: NewBoard
}

struct NewBoard: Codable {
    let grids: [Grid]
    let results: Int
    let message: String
}

struct Grid: Codable {
    let value: [[Int]]
    let solution: [[Int]]
    let difficulty: String
}


enum ApiError: Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}

extension ContentView {
    func newBoard() async throws -> BringInfo {
        let endpoint = "https://sudoku-api.vercel.app/api/dosuku"

        guard let url = URL(string: endpoint) else {
            throw ApiError.invalidUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ApiError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let bringInfo = try decoder.decode(BringInfo.self, from: data)
            return bringInfo
        } catch {
            print("Error decoding: \(error)")
            throw ApiError.invalidData
        }
    }
}
