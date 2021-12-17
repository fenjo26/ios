
import Foundation

class FootballService {
    
    private init() {}
    
    static func getFootball(complition: @escaping(FootballResponse) -> ()) {
        
        let params = [
            "limit": "30"
        ]
        
        let headers = [
            "X-Auth-Token": Constants.ApiKeys.football
        ]
        
        Networking.shared.getData(link: Constants.Urls.football, params: params, headers: headers) { result in
            
            do {
                var footballResponse = FootballResponse()
                footballResponse.decodeJson(json: result)
                complition(footballResponse)
            } catch {
                print(error)
            }
        }
        
    }
}
