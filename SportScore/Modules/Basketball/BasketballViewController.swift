
import UIKit

class BasketballViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var basketballList: [BasketballModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = Constants.Theme.primaryColor
        navigationController?.navigationBar.barTintColor = Constants.Theme.primaryColor
        navigationController?.navigationBar.tintColor = Constants.Theme.white
        
        tableView.backgroundColor = Constants.Theme.primaryColor
        tableView.delegate = self
        tableView.dataSource = self
        
        loadBasketball()
    }
    
    private func loadBasketball() {
        
        BasketballService.getBasketball() { [weak self] (response) in
            DispatchQueue.main.async {
                self?.basketballList.append(contentsOf: response.basketballList)
                self?.tableView.reloadData()
            }
        }
        
    }

}

extension BasketballViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        basketballList.count
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BasketballCell else { return UITableViewCell() }
        let item = basketballList[indexPath.row]
        cell.set(item: item)
        return cell
    }
    
}
