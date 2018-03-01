
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapOnDinamicStackViewButton(_ sender: UIButton) {
        let dynamicStackVC = DynamicStackViewController.initFromStoryboard()
        let navigationController = NavigationControllerDefault(rootViewController: dynamicStackVC)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func didTaoOnLoginInMS(_ sender: UIButton) {
        let loginInMSVC = LoginInMSViewController.initFromStoryboard()
        let navigationController = NavigationControllerDefault(rootViewController: loginInMSVC)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func didTapOnFirebaseDB(_ sender: UIButton) {
        let firebaseDB = FirebaseDBViewController.initFromStoryboard()
        let navigationController = NavigationControllerDefault(rootViewController: firebaseDB)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func didTapOnTimeZoneMVP(_ sender: UIButton) {
        let timeZoneVC = TimeZoneMVPViewController.initFromStoryboard()
        let navigationController = NavigationControllerDefault(rootViewController: timeZoneVC)
        self.present(navigationController, animated: true, completion: nil)
    }
    
}
