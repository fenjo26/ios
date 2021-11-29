
import UIKit

class BasketballCell: UITableViewCell {
    
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var firstTeamLabel: UILabel!
    @IBOutlet weak var vsLabel: UILabel!
    @IBOutlet weak var secondTeamLabel: UILabel!
    @IBOutlet weak var firstScoreLabel: UILabel!
    @IBOutlet weak var secondScoreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(item: BasketballModel) {
        contentView.backgroundColor = Constants.Theme.primaryColor
        
        bodyView.backgroundColor = Constants.Theme.white
        bodyView.layer.cornerRadius = 12
        bodyView.layer.masksToBounds = true
        
        guard let firstTeamName = item.teams.homeTeam.name, let secondTeamName = item.teams.awayTeam.name, let date = item.date, let time = item.time else { return }
        
        let firstTeamScore = item.scores.homeTeamScores.total ?? 0
        let secondTeamScore = item.scores.awayTeamScores.total ?? 0
        
        firstTeamLabel.textColor = Constants.Theme.title
        firstTeamLabel.text = firstTeamName
        
        vsLabel.textColor = Constants.Theme.gray
        
        secondTeamLabel.textColor = Constants.Theme.title
        secondTeamLabel.text = secondTeamName
        
        firstScoreLabel.textColor = Constants.Theme.description
        firstScoreLabel.text = "\(firstTeamScore)"
        
        secondScoreLabel.textColor = Constants.Theme.description
        secondScoreLabel.text = "\(secondTeamScore)"
        
        let dateArr = date.components(separatedBy: "T")
        if !dateArr.isEmpty {
            dateLabel.isHidden = false
            dateLabel.textColor = Constants.Theme.gray
            dateLabel.text = "\(dateArr[0]), \(time)"
        } else {
            dateLabel.isHidden = true
        }
    }
    
}
