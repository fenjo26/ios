
import UIKit

class FootballViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var footballList: [FootballModel] = []
    
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
        
        FootballService.getFootball() { [weak self] (response) in
            DispatchQueue.main.async {
                self?.footballList.append(contentsOf: response.footballList)
                self?.tableView.reloadData()
            }
        }
        
    }

}

extension FootballViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        footballList.count
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FootballCell else { return UITableViewCell() }
        let item = footballList[indexPath.row]
        cell.set(item: item)
        return cell
    }
    
}
