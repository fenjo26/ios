
import Foundation
import UIKit

struct Constants {
    
    struct Theme {
        static let primaryColor: UIColor = #colorLiteral(red: 0, green: 0.3267840147, blue: 0.607832253, alpha: 1)
        static let white: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let title: UIColor = #colorLiteral(red: 0.01960784314, green: 0.2470588235, blue: 0.537254902, alpha: 1)
        static let description: UIColor = #colorLiteral(red: 0.1843137255, green: 0.1882352941, blue: 0.1921568627, alpha: 1)
    }
    
    struct Icons {
        static let news = "main.news"
        static let football = "main.football"
        static let basketball = "main.basketball"
    }
    
    struct Urls {
        static let news = "https://newsapi.org/v2/top-headlines"
    }
    
    struct ApiKeys {
        static let news = "da0342071531420ea792b5283027437d"
    }
    
}
