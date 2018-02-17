
import UIKit

class TaskTableView: UITableView {

    var tasks = [Task]()
    
    func configure(tasks: [Task]) {
        self.tasks = tasks
        dataSource = self
    }
    
    func addTask(description: String) {
        let number = tasks.count + 1
        let task = Task(number: number, description: description)
        tasks.append(task)
        
        beginUpdates()
        insertRows(at: [IndexPath(row: tasks.count - 1, section: 0)], with: .automatic)
        endUpdates()
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
        
        let task = tasks[indexPath.item]
        taskCell.bindData(task: task)
        
        return taskCell
    }
    
}
