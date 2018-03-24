
import Foundation
import EmojiLog

protocol LoadClassFromStringPresenter: Presenter {
    func loadClass()
}

class LoadClassFromStringPresenterDefault: PresenterBase<LoadClassFromStringView> {
    
}

extension LoadClassFromStringPresenterDefault: LoadClassFromStringPresenter {
    
    func loadClass() {
        let className = view.className
        
        if className.isEmpty {
            view.showKO()
            return
        }
        
        //var classNameString = NSStringFromClass(className)
        if let theClass = NSClassFromString(className) {
            log.info("\(theClass)")
            view.showOk()
            return
        }
        
        view.showKO()
    }
    
}

extension LoadClassFromStringPresenterDefault: Loggable {
    
}
