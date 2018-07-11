
import UIKit

struct Feature {
    let title: String
    let destiny: UIViewController
    
    func activeNavigation(origin: UIViewController) {
        let navigationController = NavigationControllerDefault(rootViewController: destiny)
        origin.present(navigationController, animated: true, completion: nil)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var featuresTableView: UITableView!
    
    var features = [Feature]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        features.append(Feature(title: "Dynamic Stack", destiny: DynamicStackViewController.initFromStoryboard()))
        features.append(Feature(title: "Firebase DB", destiny: FirebaseDBViewController.initFromStoryboard()))
        features.append(Feature(title: "Time Zone", destiny: TimeZoneMVPViewController.initFromStoryboard()))
        features.append(Feature(title: "Load Class From String", destiny: LoadClassFromStringViewController.initFromStoryboard()))
        
        featuresTableView.dataSource = self
        featuresTableView.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell", for: indexPath)
        cell.textLabel?.text = features[indexPath.item].title
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        features[indexPath.item].activeNavigation(origin: self)
    }
    
}
