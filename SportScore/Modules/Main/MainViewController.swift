
import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var menuList: [MenuModel] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
            MenuModel(imageName: "main.news"),
            MenuModel(imageName: "main.football"),
            MenuModel(imageName: "main.basketball"),
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
        print(15151)
    }
    
}
