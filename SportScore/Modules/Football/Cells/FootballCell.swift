
import UIKit

class FootballCell: UITableViewCell {
    
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
    
    func set(item: FootballModel) {
        contentView.backgroundColor = Constants.Theme.primaryColor
        
        bodyView.backgroundColor = Constants.Theme.white
        bodyView.layer.cornerRadius = 12
        bodyView.layer.masksToBounds = true
        
        guard let firstTeamName = item.homeTeam?.name, let secondTeamName = item.awayTeam?.name, let date = item.utcDate else { return }
        
        let firstTeamScore = item.score?.fullTime.homeTeam ?? 0
        let secondTeamScore = item.score?.fullTime.awayTeam ?? 0
        
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
            let dateDay = dateArr[0]
            let fullTime = dateArr[1]
            
            let timeIndex = fullTime.index(fullTime.startIndex, offsetBy: 5)
            let time = fullTime.prefix(upTo: timeIndex)
            
            dateLabel.isHidden = false
            dateLabel.textColor = Constants.Theme.gray
            dateLabel.text = "\(dateDay), \(time)"
        } else {
            dateLabel.isHidden = true
        }
    }
    
}
