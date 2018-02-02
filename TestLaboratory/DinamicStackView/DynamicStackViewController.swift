
import UIKit

class DynamicStackViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    var colors: [UIColor] = [.black, .blue, .green, .brown, .purple, .gray, .yellow, .orange, .red, .magenta]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didTapOnNewViewButton(_ sender: Any) {
        let view = generateRamdonView()
        stackView.addArrangedSubview(view)
    }
    
    private func generateRamdonView() -> UIView {
        let view = UIView()
        let colorIndex = Int(arc4random_uniform(10))
        view.backgroundColor = colors[colorIndex]
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        return view
    }
    
    @IBAction func didTapOnCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension DynamicStackViewController: StoryboardViewController {
    static let storyboardName: String = "DynamicStack"
}
