
import Foundation
import UIKit

struct Constants {
    
    struct Theme {
        static let primaryColor: UIColor = #colorLiteral(red: 0, green: 0.3267840147, blue: 0.607832253, alpha: 1)
        static let white: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let title: UIColor = #colorLiteral(red: 0.01960784314, green: 0.2470588235, blue: 0.537254902, alpha: 1)
        static let description: UIColor = #colorLiteral(red: 0.1843137255, green: 0.1882352941, blue: 0.1921568627, alpha: 1)
        static let gray: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    struct Icons {
        static let news = "main.news"
        static let football = "main.football"
        static let basketball = "main.basketball"
        static let miniGame = "main.mini_game"
        static let calculator = "main.calculator"
    }
    
    struct MiniGameImages {
        static let background = "mini_game.background"
        static let ball1 = "mini_game.ball1"
    }
    
    struct MiniGameStrings {
        static let scoreMeta = "Очков"
    }
    
    struct Urls {
        static let main = "https://loadapp.ru/show.json"
        static let news = "https://newsapi.org/v2/top-headlines"
        static let basketball = "https://api-basketball.p.rapidapi.com/games"
        static let football = "https://api.football-data.org/v2/competitions/CL/matches"
    }
    
    struct ApiKeys {
        static let news = "da0342071531420ea792b5283027437d"
        static let basketball = "3955fbd355mshcca359fd5efac76p18e19cjsn31d9a8b0218d"
        static let football = "f283cd8b31bc492792bd222efd9c4a8b"
    }
    
}
