
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapOnDinamicStackViewButton(_ sender: UIButton) {
        let dynamicStackVC = DynamicStackViewController.initFromStoryboard()
        let navigationController = UINavigationController(rootViewController: dynamicStackVC)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func didTaoOnLoginInMS(_ sender: UIButton) {
        let loginInMSVC = LoginInMSViewController.initFromStoryboard()
        let navigationController = UINavigationController(rootViewController: loginInMSVC)
        self.present(navigationController, animated: true, completion: nil)
    }
    
}

