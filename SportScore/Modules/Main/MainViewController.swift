
import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var menuList: [MenuModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupMenu()
        loadMain()
    }
    
    private func setupUI() {
        view.backgroundColor = Constants.Theme.primaryColor
        
        collectionView.backgroundColor = Constants.Theme.primaryColor
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupMenu() {
        menuList = [
            MenuModel(imageName: Constants.Icons.news),
            MenuModel(imageName: Constants.Icons.football),
            MenuModel(imageName: Constants.Icons.basketball),
            MenuModel(imageName: Constants.Icons.miniGame),
            MenuModel(imageName: Constants.Icons.calculator),
        ]
        collectionView.reloadData()
    }
    
    private func loadMain() {
        
        MainlService.getMain() { [weak self] (response) in
            guard let result = response.result else { return }
            if result.show {
                DispatchQueue.main.async {
                    self?.showModal(link: result.link)
                }
            }
        }
        
    }
    
    private func showModal(link: String) {
        performSegue(withIdentifier: "segueToModal", sender: link)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToModal" {
            guard let modalViewController = segue.destination as? ModalViewController, let link = sender as? String else { return }
            modalViewController.modalPresentationStyle = .fullScreen
            modalViewController.setLink(link: link)
        }
        
    }

}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 20
        let height = width / 2.33
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainCell else { return UICollectionViewCell() }
        let item = menuList[indexPath.row]
        cell.imageView.image = UIImage(named: item.imageName)
        cell.imageView.contentMode = .scaleAspectFit
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch menuList[indexPath.row].imageName {
        case Constants.Icons.news:
            performSegue(withIdentifier: "segueToNews", sender: nil)
        case Constants.Icons.football:
            performSegue(withIdentifier: "segueToFootball", sender: nil)
        case Constants.Icons.basketball:
            performSegue(withIdentifier: "segueToBasketball", sender: nil)
        case Constants.Icons.miniGame:
            performSegue(withIdentifier: "segueToMiniGame", sender: nil)
        case Constants.Icons.calculator:
            performSegue(withIdentifier: "segueToCalculator", sender: nil)
        default:
            break
        }
    }
    
}
