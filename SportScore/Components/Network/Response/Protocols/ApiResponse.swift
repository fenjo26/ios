import Foundation

protocol ApiResponse {
    mutating func decodeJson(json: String)
}
