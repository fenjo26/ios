
import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(item: NewsModel) {
        contentView.backgroundColor = Constants.Theme.primaryColor
        
        bodyView.backgroundColor = Constants.Theme.white
        bodyView.layer.cornerRadius = 12
        bodyView.layer.masksToBounds = true
        
        if !item.title.isEmpty {
            titleLabel.isHidden = false
            titleLabel.textColor = Constants.Theme.title
            titleLabel.text = item.title
        } else {
            titleLabel.isHidden = true
        }
        
        if let description = item.description, !description.isEmpty {
            descriptionLabel.isHidden = false
            descriptionLabel.textColor = Constants.Theme.description
            descriptionLabel.text = description
        } else {
            descriptionLabel.isHidden = true
        }
        
        if let urlToImage = item.urlToImage, !urlToImage.isEmpty, let imageURL = URL(string: urlToImage) {
            ImageNetworking.shared.getImage(link: imageURL) { (img) in
                DispatchQueue.main.async {
                    self.photoView.isHidden = false
                    self.photoView.image = img
                    self.photoView.layer.cornerRadius = 12
                    self.photoView.layer.masksToBounds = true
                }
            }
        } else {
            photoView.isHidden = true
        }
    }
    
}
