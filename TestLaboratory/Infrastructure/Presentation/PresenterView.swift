
import UIKit

public protocol PresenterView {
    
}

open class ViewControllerWithPresenter<P>: UIViewController {
    
    public var presenter: P!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        if let presenter = self.presenter as? Presenter {
            presenter.setView(view: self)
            presenter.viewDidLoad()
        }
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let presenter = self.presenter as? Presenter {
            presenter.viewWillAppear()
        }
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let presenter = self.presenter as? Presenter {
            presenter.viewDidAppear()
        }
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let presenter = self.presenter as? Presenter {
            presenter.viewWillDisappear()
        }
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let presenter = self.presenter as? Presenter {
            presenter.viewDidDisappear()
        }
    }
    
}
