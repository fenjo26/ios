
import UIKit

class MiniGameViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var imageBall: UIImageView!
    @IBOutlet weak var imageGift: UIImageView!
    
    private var score = 0
    private let timerDelay: TimeInterval = 3
    private var giftTimer: Timer?
    private var currentGiftIndex = 0
    
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
        
        imageGift.isHidden = true
        if let image = UIImage(named: Constants.MiniGameImages.gift) {
            imageGift.image = image
            
            let tapGift = UITapGestureRecognizer(target: self, action: #selector(giftTapped))
            imageGift.isUserInteractionEnabled = true
            imageGift.addGestureRecognizer(tapGift)
        }
    }
    
    private func showScore() {
        scoreLabel.text = "\(score) \(Constants.MiniGameStrings.scoreMeta)"
    }
    
    @objc func ballTapped() {
        score += 1
        animationBall()
        detectGiftScore()
    }
    
    private func animationBall() {
        
        imageBall.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        UIView.animate(withDuration: 0.10, animations: {
            self.showScore()
            self.imageBall.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
        
    }
    
    private func detectGiftScore() {
        if score == Constants.MiniGameSettings.giftScore {
            imageGift.isHidden = false
            
            showAnimation()
            setAnimationTimer()
        }
    }
    
    private func setAnimationTimer() {
        giftTimer = Timer.scheduledTimer(withTimeInterval: timerDelay, repeats: true) {
            [weak self] _ in
            self?.showAnimation()
        }
    }
    
    private func removeTimer() {
        giftTimer?.invalidate()
        giftTimer = nil
    }
    
    private func showAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.08
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: imageGift.center.x - 10, y: imageGift.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: imageGift.center.x + 10, y: imageGift.center.y))
        
        DispatchQueue.main.async {
            self.imageGift.layer.add(animation, forKey: "position")
        }
    }
    
    @objc func giftTapped() {
        score = 0
        showScore()
        
        imageGift.isHidden = true
        removeTimer()
        
        currentGiftIndex += 1
        performSegue(withIdentifier: "toGiftNews", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toGiftNews" {
            guard let giftNewsViewController = segue.destination as? GiftNewsViewController else { return }
            giftNewsViewController.modalPresentationStyle = .automatic
            giftNewsViewController.currentGiftIndex = currentGiftIndex
        }
        
    }
    
    deinit {
        removeTimer()
    }

}
