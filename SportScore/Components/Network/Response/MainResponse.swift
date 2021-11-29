
import Foundation

struct MainResponse: Decodable, ApiResponse {
    var result: MainModel?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
    }
    
    mutating func decodeJson(json: String) {
        
        // Обрабатываем полученные данные
        guard !json.isEmpty else { return }
        
        let jsonData = Data(json.utf8)
        let decoder = JSONDecoder()
        
        do {
            let responseDecode = try decoder.decode(MainResponse.self, from: jsonData)
            self.result = responseDecode.result
        } catch {
            print(error)
        }
        
    }
}
