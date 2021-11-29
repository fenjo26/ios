
import Foundation

struct BasketballModel: Decodable {
    var teams: TeamsModel
    var scores: ScoresModel
    var date: String?
    var time: String?
    
    enum CodingKeys: String, CodingKey {
        case teams = "teams"
        case scores = "scores"
        case date = "date"
        case time = "time"
    }
}

struct TeamsModel: Decodable {
    var homeTeam: HomeTeamModel
    var awayTeam: AwayTeamModel
    
    enum CodingKeys: String, CodingKey {
        case homeTeam = "home"
        case awayTeam = "away"
    }
}

struct HomeTeamModel: Decodable {
    var name: String?
}

struct AwayTeamModel: Decodable {
    var name: String?
}

struct ScoresModel: Decodable {
    var homeTeamScores: HomeTeamScores
    var awayTeamScores: AwayTeamScores
    
    enum CodingKeys: String, CodingKey {
        case homeTeamScores = "home"
        case awayTeamScores = "away"
    }
}

struct HomeTeamScores: Decodable {
    var total: Int?
}

struct AwayTeamScores: Decodable {
    var total: Int?
}
