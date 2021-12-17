
import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var newsList: [NewsModel] = []
    
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
        
        loadNews()
    }
    
    private func loadNews() {
        
        NewsService.getNews() { [weak self] (response) in
            DispatchQueue.main.async {
                self?.newsList.append(contentsOf: response.news)
                self?.tableView.reloadData()
            }
        }
        
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewsCell else { return UITableViewCell() }
        let item = newsList[indexPath.row]
        cell.set(item: item)
        return cell
    }
    
}
