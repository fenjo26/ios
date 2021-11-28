
import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var menuList: [MenuModel] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
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
        ]
        collectionView.reloadData()
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
            print(222)
        case Constants.Icons.basketball:
            print(333)
        default:
            break
        }
    }
    
}
