import Foundation

struct BringApiData:Codable{
    let login: String
    let avatarUrl: String
    let bio:String?
    
}

enum ApiError: Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}

//Content View extention, just for a better organization, bring the data and decode to show on itsef view
extension ContentView{
    func getUser() async throws -> BringApiData{
        let endpoint = "https://api.github.com/users/J41R0JUNIOR"
        
        guard let url = URL(string: endpoint) else {
            throw ApiError.invalidUrl
            
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw ApiError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(BringApiData.self, from: data)
        } catch{
            throw ApiError.invalidData
        }
    }
}
