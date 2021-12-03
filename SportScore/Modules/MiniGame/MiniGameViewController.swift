
import UIKit

class MiniGameViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageBall: UIImageView!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if let background = UIImage(named: Constants.MiniGameImages.background) {
            view.backgroundColor = UIColor(patternImage: background)
        }
        
        navigationController?.navigationBar.barTintColor = Constants.Theme.primaryColor
        navigationController?.navigationBar.tintColor = Constants.Theme.white
        
        scoreLabel.textColor = Constants.Theme.white
        showScore()
        
        if let image = UIImage(named: Constants.MiniGameImages.ball1) {
            imageBall.image = image
            
            let tapBall = UITapGestureRecognizer(target: self, action: #selector(ballTapped))
            imageBall.isUserInteractionEnabled = true
            imageBall.addGestureRecognizer(tapBall)
        }
    }
    
    private func showScore() {
        scoreLabel.text = "\(score) \(Constants.MiniGameStrings.scoreMeta)"
    }
    
    @objc func ballTapped() {
        score += 1
        animationBall()
    }
    
    private func animationBall() {
        
        imageBall.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        UIView.animate(withDuration: 0.10, animations: {
            self.showScore()
            self.imageBall.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
        
    }

}
