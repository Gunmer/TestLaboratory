
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapOnDinamicStackViewButton(_ sender: UIButton) {
        let viewController = DinamicStackViewController.initFromStoryboard()
        self.present(viewController, animated: true, completion: nil)
    }
    
    
}

