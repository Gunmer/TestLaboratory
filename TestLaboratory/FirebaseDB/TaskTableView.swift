
import UIKit

class TaskTableView: UITableView {

    var tasks = [Task]()
    
    func configure(tasks: [Task]) {
        self.tasks = tasks
        
        dataSource = self
        
        reloadData()
    }
    
    func addTask(description: String) -> Task {
        let task = Task()
        task.number = tasks.count + 1
        task.description = description
        
        tasks.append(task)
        
        beginUpdates()
        insertRows(at: [IndexPath(row: tasks.count - 1, section: 0)], with: .automatic)
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
        
        let task = tasks[indexPath.item]
        taskCell.bindData(task: task)
        
        return taskCell
    }
    
}
