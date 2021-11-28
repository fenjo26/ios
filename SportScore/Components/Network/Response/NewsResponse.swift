
import Foundation

struct NewsResponse: Decodable, ApiResponse {
    var status: String?
    var news = [NewsModel]()
     
     enum CodingKeys: String, CodingKey {
         case status = "status"
         case news = "articles"
     }
     
     mutating func decodeJson(json: String) {
         
         // Обрабатываем полученные данные
         guard !json.isEmpty else { return }
         
         let jsonData = Data(json.utf8)
         let decoder = JSONDecoder()
         
         do {
             let responseDecode = try decoder.decode(NewsResponse.self, from: jsonData)
             self.status = responseDecode.status
             self.news = responseDecode.news
         } catch {
             print(error)
         }
         
     }
}
