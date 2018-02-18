
import UIKit

protocol TaskTableViewDelegate: NSObjectProtocol {
    func willDeleteTask(task: Task)
}

class TaskTableView: UITableView {

    var tasks = [Task]()
    weak var taskTableViewDelegate: TaskTableViewDelegate?
    
    func configure(tasks: [Task]) {
        self.tasks = tasks
        
        dataSource = self
        
        reloadData()
    }
    
    func addTask(description: String) -> Task {
        let task = Task()
        task.number = tasks.count + 1
        task.description = description
        
        let taskRow = tasks.count
        
        tasks.append(task)
        
        beginUpdates()
        insertRows(at: [IndexPath(row: taskRow, section: 0)], with: .automatic)
        endUpdates()
        
        return task
    }
}

extension TaskTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let taskCell = dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell else {
            fatalError("Cell is not type TaskCell")
        }
        
        let task = tasks[indexPath.row]
        taskCell.bindData(task: task)
        
        return taskCell
    }
    
}

extension TaskTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            taskTableViewDelegate?.willDeleteTask(task: task)
            
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
