
public protocol Presenter {
    
    func setView(view: Any)
    
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

open class PresenterBase<V>: Presenter {
    
    public var view: V!
    
    open func setView(view: Any) {
        guard let v = view as? V else {
            fatalError()
        }
        self.view = v
    }
    
    open func viewDidLoad() { }
    
    open func viewWillAppear() { }
    
    open func viewDidAppear() { }
    
    open func viewWillDisappear() { }
    
    open func viewDidDisappear() { }
    
}
