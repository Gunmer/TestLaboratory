
import UIKit

class FirebaseDBViewController: UIViewController {
    
    @IBOutlet weak var taskTable: TaskTableView!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Firebase Data Base"
        
        let tasks = [Task(number: 1, description: "Primera tarea")]
        taskTable.configure(tasks: tasks)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapOnAdd(_ sender: UIButton) {
        guard let description = inputTextField.text else {
            return
        }
        
        taskTable.addTask(description: description)
        inputTextField.text = nil
    }
    
}

extension FirebaseDBViewController: StoryboardViewController {
    
    static var storyboardName: String {
        return "FirebaseDB"
    }
    
}
