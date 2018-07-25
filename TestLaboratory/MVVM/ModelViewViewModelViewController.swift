
import UIKit
import EmojiLog

class ModelViewViewModelViewController: UIViewController {

    @IBOutlet weak var label: VMLabel!
    @IBOutlet weak var textField: VMTextField!
    @IBOutlet weak var textField2: VMTextField!
    
    let stringVM = StringViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.addViewModel(viewModel: stringVM)
        textField.addViewModel(viewModel: stringVM)
        textField2.addViewModel(viewModel: stringVM)
    }

}

extension ModelViewViewModelViewController: StoryboardViewController {
    static var storyboardName: String = "ModelViewViewModel"
}

class ViewModel<T> {
    let id: NSNotification.Name
    
    var value: T? {
        didSet {
            NotificationCenter.default.post(name: id, object: self, userInfo: nil)
        }
    }
    
    init() {
        id = NSNotification.Name(rawValue: UUID().uuidString)
    }
}

class StringViewModel: ViewModel<String> {}

class VMLabel: UILabel, Loggable {
    
    weak var viewModel: ViewModel<String>?
    
    func addViewModel(viewModel: ViewModel<String>) {
        log.info("\(viewModel)")
        NotificationCenter.default.addObserver(self, selector: #selector(changeValueIn), name: viewModel.id, object: nil)
        //addTarget(self, action: #selector(changeValueOut), for: .valueChanged)
        
        self.viewModel = viewModel
    }
    
    @objc func changeValueIn() {
        log.info("\(viewModel?.value)")
        text = viewModel?.value
    }
    
    @objc func changeValueOut() {
        viewModel?.value = text
        log.info("\(viewModel?.value)")
    }
    
    deinit {
        viewModel = nil
        NotificationCenter.default.removeObserver(self)
    }
    
}

class VMTextField: UITextField, Loggable {
    
    weak var viewModel: ViewModel<String>?
    
    func addViewModel(viewModel: ViewModel<String>) {
        log.info("\(viewModel)")
        NotificationCenter.default.addObserver(self, selector: #selector(changeValueIn), name: viewModel.id, object: nil)
        addTarget(self, action: #selector(changeValueOut), for: .allEditingEvents)
        
        self.viewModel = viewModel
    }
    
    @objc func changeValueIn() {
        log.info("\(viewModel?.value)")
        text = viewModel?.value
    }
    
    @objc func changeValueOut() {
        viewModel?.value = text
        log.info("\(viewModel?.value)")
    }
    
    deinit {
        viewModel = nil
        NotificationCenter.default.removeObserver(self)
    }
    
}
