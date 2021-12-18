
import UIKit

class GiftNewsViewController: UIViewController {

    @IBOutlet weak var btnClose: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var contentPhotoView: UIImageView!
    @IBOutlet weak var contentTitleLabel: UILabel!
    @IBOutlet weak var contentDescriptionLabel: UILabel!
    
    var newsList: [NewsModel] = []
    var currentGiftIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = Constants.Theme.primaryColor
        navigationController?.navigationBar.barTintColor = Constants.Theme.primaryColor
        navigationController?.navigationBar.tintColor = Constants.Theme.white
        
        btnClose.setTitle("", for: .normal)
        
        loadNews()
    }
    
    private func loadNews() {
        
        NewsService.getNews() { [weak self] (response) in
            DispatchQueue.main.async {
                self?.newsList.append(contentsOf: response.news)
                self?.showNews()
            }
        }
        
    }

    @IBAction func tappedClose(_ sender: Any) {
        closeGiftNews()
    }
    
    private func closeGiftNews() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func showNews() {
        var indexNews = currentGiftIndex - 1
        guard !newsList.isEmpty else {
            closeGiftNews()
            return
        }
        
        if !newsList.indices.contains(indexNews) {
            indexNews = 0
        }
        
        setContentNewsViews(item: newsList[indexNews])
    }
    
    private func setContentNewsViews(item: NewsModel) {
        contentView.isHidden = false
        contentView.backgroundColor = Constants.Theme.white
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        
        if !item.title.isEmpty {
            contentTitleLabel.isHidden = false
            contentTitleLabel.textColor = Constants.Theme.title
            contentTitleLabel.text = item.title
        } else {
            contentTitleLabel.isHidden = true
        }
        
        if let description = item.description, !description.isEmpty {
            contentDescriptionLabel.isHidden = false
            contentDescriptionLabel.textColor = Constants.Theme.description
            contentDescriptionLabel.text = description
        } else {
            contentDescriptionLabel.isHidden = true
        }
        
        if let urlToImage = item.urlToImage, !urlToImage.isEmpty, let imageURL = URL(string: urlToImage) {
            ImageNetworking.shared.getImage(link: imageURL) { (img) in
                DispatchQueue.main.async {
                    self.contentPhotoView.isHidden = false
                    self.contentPhotoView.image = img
                    self.contentPhotoView.layer.cornerRadius = 12
                    self.contentPhotoView.layer.masksToBounds = true
                }
            }
        } else {
            contentPhotoView.isHidden = true
        }
    }
    
}
