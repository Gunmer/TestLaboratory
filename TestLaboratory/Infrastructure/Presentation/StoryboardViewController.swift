
import UIKit

protocol StoryboardViewController {
    static var storyboardName: String { get }
}

extension StoryboardViewController {
    static func initFromStoryboard(bundle: Bundle?) -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        
        guard let viewController = storyboard.instantiateInitialViewController() else {
            fatalError("View controller is not initial")
        }
        
        guard let selfViewController = viewController as? Self else {
            fatalError("View controller is not correct type")
        }
        
        return selfViewController
    }
    
    static func initFromStoryboard() -> Self {
        return Self.initFromStoryboard(bundle: nil)
    }
}
