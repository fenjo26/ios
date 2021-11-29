
import UIKit
import WebKit

class ModalViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var link = ""
    
    func setLink(link: String) {
        if !link.isEmpty {
            self.link = link
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        openLink()
    }
    
    private func setupUI() {
        view.backgroundColor = Constants.Theme.primaryColor
        webView.backgroundColor = Constants.Theme.primaryColor
    }
    
    private func openLink() {
        if !link.isEmpty, let url = URL(string: link) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

}
