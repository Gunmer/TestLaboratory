
import UIKit

class NavigationControllerDefault: UINavigationController {

    override func viewDidLoad() {
        delegate = self
    }
    
}

extension NavigationControllerDefault: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let closeButton = UIBarButtonItem(image: UIImage(named: "ic_close"), style: .plain, target: self, action: #selector(diTapOnClose))
        
        viewController.navigationItem.rightBarButtonItems = [closeButton]
    }
    
    @objc func diTapOnClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapOnBack() {
        popViewController(animated: true)
    }
    
}
