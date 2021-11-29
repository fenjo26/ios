
import Foundation

struct BasketballResponse: Decodable, ApiResponse {
    var basketballList = [BasketballModel]()
     
     enum CodingKeys: String, CodingKey {
         case basketballList = "response"
     }
     
     mutating func decodeJson(json: String) {
         
         // Обрабатываем полученные данные
         guard !json.isEmpty else { return }
         
         let jsonData = Data(json.utf8)
         let decoder = JSONDecoder()
         
         do {
             let responseDecode = try decoder.decode(BasketballResponse.self, from: jsonData)
             self.basketballList = responseDecode.basketballList
         } catch {
             print(error)
         }
         
     }
}
