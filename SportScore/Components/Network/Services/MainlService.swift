
import Foundation

class MainlService {
    
    private init() {}
    
    static func getMain(complition: @escaping(MainResponse) -> ()) {
        
        let params = [String: String]()
        
        Networking.shared.getData(link: Constants.Urls.main, params: params, headers: [:]) { result in
            
            do {
                var mainResponse = MainResponse()
                mainResponse.decodeJson(json: result)
                complition(mainResponse)
            } catch {
                print(error)
            }
        }
        
    }
}
