
import Foundation

struct FootballModel: Decodable {
    var homeTeam: HomeTeamFootballModel?
    var awayTeam: AwayTeamFootballModel?
    var score: ScoreFootballModel?
    var utcDate: String?
    
    enum CodingKeys: String, CodingKey {
        case homeTeam = "homeTeam"
        case awayTeam = "awayTeam"
        case score = "score"
        case utcDate = "utcDate"
    }
}

struct HomeTeamFootballModel: Decodable {
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct AwayTeamFootballModel: Decodable {
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct ScoreFootballModel: Decodable {
    var fullTime: FullTimeFootballModel
    
    enum CodingKeys: String, CodingKey {
        case fullTime = "fullTime"
    }
}

struct FullTimeFootballModel: Decodable {
    var homeTeam: Int?
    var awayTeam: Int?
    
    enum CodingKeys: String, CodingKey {
        case homeTeam = "homeTeam"
        case awayTeam = "awayTeam"
    }
}
