//
//  ViewController.swift
//  UITest01
//
//  Created by Jairo Júnior on 11/09/23.
//
import UserNotifications
import UIKit
import CoreData




class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: "PersonCell")
        return tableView
    }()
    
    var items: [Person] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pessoas"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        fetchPeople()
    }
    
    
    
    func fetchPeople() {
        
        
        do {
            let request = Person.fetchRequest() as NSFetchRequest<Person>
            
//            let pred = NSPredicate(format: "name CONTAINS %@", "Slim Shady")
//            request.predicate = pred
            
            let sortDescriptior = NSSortDescriptor(key: "date", ascending: true)
            request.sortDescriptors = [sortDescriptior]
            
            self.items = try context.fetch(request)
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        } catch {
            print("Erro ao buscar pessoas: \(error)")
        }
    }
    
    
    
    func relashionshio(name:String, nameTask:String){
        let person = Person(context: context)
        person.name = name
        
        let task = Task(context: context)
        task.nomeTask = nameTask
        task.dataTask = Date()
        
        //task.person 
        
        DataController().saveData(context: context)
    }
    
    
    
    @objc func addTapped() {
        let alert = UIAlertController(title: "Adicionar Pessoa", message: "Digite o nome da pessoa", preferredStyle: .alert)
        alert.addTextField()
        
        let addAction = UIAlertAction(title: "Adicionar", style: .default) { [weak self] _ in
            if let textField = alert.textFields?.first, let name = textField.text {
                DataController().addPerson(name: name, context: self!.context)
                self?.fetchPeople()
             //   self?.dismiss(animated: true)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
   
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonTableViewCell
        
        let person = items[indexPath.row]
        cell.configure(withName: person.name ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //create swipeAction
        let action = UIContextualAction(style: .destructive, title: "Delete"){ (action, view, completitionHandler) in
           
            //witch person
            let personToRemove = self.items[indexPath.row]
            
            //remove the person
            self.context.delete(personToRemove)
            
            //save the data without the person deleted
            DataController().saveData(context: self.context)
            
            //re fetch the data to show only the persons that havent been deleted
            self.fetchPeople()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = self.items[indexPath.row]
        
        
        /*
        //create alert
        let alert = UIAlertController(title: "Edit Person", message: "Edit name:", preferredStyle: .alert)
        
        alert.addTextField()
        
        let textfield = alert.textFields?[0]
        textfield?.text = person.name
        
        //configure button handler
        let saveButton = UIAlertAction(title: "Save", style: .default){(action) in
            let textfield = alert.textFields?[0]
            
            //edit the name
            person.name = textfield?.text
            DataController().saveData(context: self.context)
            self.fetchPeople()
        }
        
        alert.addAction(saveButton)
        self.present(alert, animated: true, completion: nil)
         
         */
        
        // Create an instance of SecondViewController
        let secondVC = EspeciefiedView(name: person.name, person: person, context: context)
                
        // Push the SecondViewController onto the navigation stack
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
}


#Preview{ViewController()}
