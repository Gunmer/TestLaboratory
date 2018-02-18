
import UIKit
import Firebase
import FirebaseDatabase
import ObjectMapper
import EmojiLog

class FirebaseDBViewController: UIViewController {
    
    @IBOutlet weak var taskTable: TaskTableView!
    @IBOutlet weak var inputTextField: UITextField!
    
    var firebase: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebase = Database.database().reference()

        title = "Firebase Data Base"
        
        firebase?.child("tasks").observeSingleEvent(of: .value, with: { snapshot in
            let json = snapshot.value as? [String:AnyObject]
            let array = json?.map({$0.value})
            if var tasks = Mapper<Task>().mapArray(JSONObject: array) {
                self.log.debug("\(tasks.toJSONString(prettyPrint: true)!)")
                tasks.sort(by: { (left, right) -> Bool in
                    return left.number < right.number
                })
                self.taskTable.configure(tasks: tasks)
            }
        })
    }

    @IBAction func didTapOnAdd(_ sender: UIButton) {
        guard let description = inputTextField.text else {
            return
        }
        
        let task = taskTable.addTask(description: description)
        inputTextField.text = nil
        
        firebase?.child("tasks").childByAutoId().setValue(task.toJSON())
    }
    
}

extension FirebaseDBViewController: StoryboardViewController {
    
    static var storyboardName: String {
        return "FirebaseDB"
    }
    
}

extension FirebaseDBViewController: Loggable {
    
}
