
import Foundation

struct FootballResponse: Decodable, ApiResponse {
    var footballList = [FootballModel]()
     
     enum CodingKeys: String, CodingKey {
         case footballList = "matches"
     }
     
     mutating func decodeJson(json: String) {
         
         // Обрабатываем полученные данные
         guard !json.isEmpty else { return }
         
         let jsonData = Data(json.utf8)
         let decoder = JSONDecoder()
         
         do {
             let responseDecode = try decoder.decode(FootballResponse.self, from: jsonData)
             self.footballList = responseDecode.footballList
         } catch {
             print(error)
         }
         
     }
}
