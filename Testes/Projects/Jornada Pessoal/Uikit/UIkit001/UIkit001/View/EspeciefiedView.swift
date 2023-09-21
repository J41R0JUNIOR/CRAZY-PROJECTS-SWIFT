import UIKit
import CoreData

class EspeciefiedView: UIViewController {
    let name: String?
    let context: NSManagedObjectContext
    let person: Person?
    //var items: [Person] = []
    var tasks: [Task] = []

    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: "PersonCell")
        return tableView
    }()

    init(name: String?, person:Person, context: NSManagedObjectContext) {
        self.name = name
        self.context = context
        self.person = person
        super.init(nibName: nil, bundle: nil) // Call the designated initializer of UIViewController
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        fetchTasks()
    }
    
    
    func fetchTasks() {
        guard let person = self.person,
              let personTasks = person.tasks?.allObjects as? [Task] else {
            return
        }

        self.tasks = personTasks

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
    
    
    @objc func addTapped() {
        let alert = UIAlertController(title: "Adicionar Task", message: "Digite o nome da task", preferredStyle: .alert)
        alert.addTextField()
        
        let addAction = UIAlertAction(title: "Adicionar", style: .default) { [weak self] _ in
            if let textField = alert.textFields?.first, let nameTask = textField.text, let contextTask = self?.context, let personTask = self?.person {
                
                DataController().addTask(nameTask: nameTask, contextTask: contextTask, personTask: personTask)
                
                self?.fetchTasks()
                
//                let task = Task(context: contextTask)
//                task.nomeTask = nameTask
//                task.dataTask = Date()
//                task.person = personTask
//                
//                // Salve a tarefa no contexto
//                DataController().saveData(context: contextTask)
//                
//                // Recarregue as tarefas
//                self?.fetchTasks()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }

    
}



extension EspeciefiedView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonTableViewCell

        let task = tasks[indexPath.row]
        cell.configure(withName: task.nomeTask ?? "")

        return cell
    }

}
