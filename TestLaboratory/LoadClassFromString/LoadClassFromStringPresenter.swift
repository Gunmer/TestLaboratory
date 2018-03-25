
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
        
        let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
        
        if let theClass = NSClassFromString("\(appName).\(className)") {
            
            log.info("\(theClass)")
            view.showOk()
            return
        }
        
        view.showKO()
    }
    
}

extension LoadClassFromStringPresenterDefault: Loggable {
    
}
