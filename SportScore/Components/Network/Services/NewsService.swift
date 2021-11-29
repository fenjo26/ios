
import Foundation

class NewsService {
    
    private init() {}
    
    static func getNews(complition: @escaping(NewsResponse) -> ()) {
        
        let dateNow = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        var params = [
            "country": "ru",
            "category": "sport",
            "from": formatter.string(from: dateNow),
            "sortBy": "publishedAt",
            "apiKey": Constants.ApiKeys.news
        ]
        
        Networking.shared.getData(link: Constants.Urls.news, params: params, headers: [:]) { result in
            
            do {
                var newsResponse = NewsResponse()
                newsResponse.decodeJson(json: result)
                if let status = newsResponse.status, status == "ok" {
                    complition(newsResponse)
                }
            } catch {
                print(error)
            }
        }
        
    }
}
