
import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var betForm: UITextField!
    @IBOutlet weak var coefficientForm: UITextField!
    @IBOutlet weak var btnCalculate: UIButton!
    @IBOutlet weak var resultWin: UILabel!
    
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
        
        titleLabel.text = Constants.CalculatorStrings.title
        titleLabel.textColor = Constants.Theme.white
        
        betForm.font = UIFont.systemFont(ofSize: 17)
        betForm.textColor = Constants.Theme.primaryColor
        betForm.placeholder = Constants.CalculatorStrings.bet
        betForm.keyboardType = .decimalPad
        
        coefficientForm.font = UIFont.systemFont(ofSize: 17)
        coefficientForm.textColor = Constants.Theme.primaryColor
        coefficientForm.placeholder = Constants.CalculatorStrings.coefficient
        coefficientForm.keyboardType = .decimalPad
        
        btnCalculate.setTitle(Constants.CalculatorStrings.calculate, for: .normal)
        btnCalculate.setTitleColor(Constants.Theme.white, for: .normal)
        btnCalculate.backgroundColor = Constants.Theme.orange
        btnCalculate.layer.cornerRadius = 12
        btnCalculate.layer.masksToBounds = true
        
        resultWin.textColor = Constants.Theme.white
        resultWin.isHidden = true
    }
    
    @IBAction func tapCalculate(_ sender: Any) {
        resultWin.isHidden = true
        
        guard let bet = betForm.text, let coefficient = coefficientForm.text, !bet.isEmpty, !coefficient.isEmpty, let floatBet = Float(bet), let floatCoefficient = Float(coefficient) else { return }
        
        let result = floatBet * floatCoefficient
        if NSString(format: "%.2f", result) == NSString(format: "%.2f", Float(Int(result))) {
            resultWin.text = "\(Constants.CalculatorStrings.win) \(Int(result))"
            resultWin.isHidden = false
        } else {
            resultWin.text = "\(Constants.CalculatorStrings.win) \(NSString(format: "%.2f", result))"
            resultWin.isHidden = false
        }
    }
    
}
