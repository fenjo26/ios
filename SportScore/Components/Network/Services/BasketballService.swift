
import Foundation

class BasketballService {
    
    private init() {}
    
    static func getBasketball(complition: @escaping(BasketballResponse) -> ()) {
        
        let dateNow = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        var params = [
            "timezone": "Europe/Moscow",
            "date": formatter.string(from: dateNow)
        ]
        
        let headers = [
            "x-rapidapi-host": "api-basketball.p.rapidapi.com",
            "x-rapidapi-key": Constants.ApiKeys.basketball
        ]
        
        Networking.shared.getData(link: Constants.Urls.basketball, params: params, headers: headers) { result in
            
            do {
                var basketballResponse = BasketballResponse()
                basketballResponse.decodeJson(json: result)
                complition(basketballResponse)
            } catch {
                print(error)
            }
        }
        
    }
}
