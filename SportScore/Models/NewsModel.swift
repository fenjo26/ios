
import Foundation

struct NewsModel: Decodable {
    var title: String
    var description: String?
    var content: String?
    var urlToImage: String?
}
