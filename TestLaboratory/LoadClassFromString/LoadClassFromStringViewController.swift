
import UIKit

protocol LoadClassFromStringView {
    var className: String { get }
    
    func showOk()
    func showKO()
}

class LoadClassFromStringViewController: ViewControllerWithPresenter<LoadClassFromStringPresenter> {

    @IBOutlet weak var classNameTextField: UITextField!
    @IBOutlet weak var okImage: UIImageView!
    @IBOutlet weak var koImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        okImage.isHidden = true
        koImage.isHidden = true
    }
    
    @IBAction func didTapOnLoad(_ sender: UIButton) {
        presenter.loadClass()
    }
    
}

extension LoadClassFromStringViewController: StoryboardViewController {
    
    static var storyboardName: String {
        return "LoadClassFromString"
    }
    
}

extension LoadClassFromStringViewController: LoadClassFromStringView {
    
    var className: String {
        return classNameTextField.text ?? ""
    }
    
    func showOk() {
        okImage.isHidden = false
        koImage.isHidden = true
    }
    
    func showKO() {
        okImage.isHidden = true
        koImage.isHidden = false
    }
    
}
