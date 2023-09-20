//
//  ViewController.swift
//  UITest01
//
//  Created by Jairo Júnior on 11/09/23.
//
import UserNotifications
import UIKit
import CoreData

/*
class ViewController: UIViewController{
    
    lazy var tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.isScrollEnabled = false
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableview.backgroundColor = .gray
        
        return tableview
    }()

    let button = UIButton()

    var qtd:Int = 0

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var itens:[Person]?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        //
        //
        fetchPeople()
        setUp()
        
        
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
     
    }

    
    func fetchPeople() {
        //Fetch the data from Core Data to display in the tableview
        do{
            self.itens = try context.fetch(Person.fetchRequest())
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
                print("att")
            }
            
        }catch{
            
        }
    }
    
    @IBAction func addTapped(_ sender: Any){
        let alert = UIAlertController(title: "Add Person", message: "What is their name?", preferredStyle: .alert)
        alert.addTextField()
        
        let submitButton = UIAlertAction(title: "Add", style: .default){ (action) in
            let textfield = alert.textFields![0]
            print(self.itens?.count ?? 0)
            
        }
        
        alert.addAction(submitButton)
        self.present(alert, animated: true, completion: nil)
         
    }
    
    func setUp(){
        
        view.addSubview(button)
        
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .red
        button.configuration?.title = "Add Person"
        
        button.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        /////
       
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 350),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
 
    }
}


extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let person = self.itens![indexPath.row]
        
        cell.textLabel?.text = person.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
*/


//class PersonTableViewCell: UITableViewCell {
//    let nameLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        contentView.addSubview(nameLabel)
//        
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
//        ])
//        
//        backgroundColor = .black
//        selectionStyle = .none
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configure(withName name: String) {
//        nameLabel.text = name
//        print(nameLabel.text)
//    }
//}
//
//
//class ViewController: UIViewController {
//    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .plain)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: "PersonCell")
//        return tableView
//    }()
//    
//    var items: [Person] = []
//    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        title = "Pessoas"
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
//        
//        view.addSubview(tableView)
//        
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        
//        fetchPeople()
//    }
//    
//    func fetchPeople() {
//        do {
//            items = try context.fetch(Person.fetchRequest())
//            tableView.reloadData()
//        } catch {
//            print("Erro ao buscar pessoas: \(error)")
//        }
//    }
//    
//    @objc func addTapped() {
//        let alert = UIAlertController(title: "Adicionar Pessoa", message: "Digite o nome da pessoa", preferredStyle: .alert)
//        alert.addTextField()
//        
//        let addAction = UIAlertAction(title: "Adicionar", style: .default) { [weak self] _ in
//            if let textField = alert.textFields?.first, let name = textField.text {
//                self?.addPerson(name: name)
//            }
//        }
//        
//        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
//        
//        alert.addAction(addAction)
//        alert.addAction(cancelAction)
//        
//        present(alert, animated: true, completion: nil)
//    }
//    
//    func addPerson(name: String) {
//        let person = Person(context: context)
//        person.name = name
//        
//        do {
//            try context.save()
//            fetchPeople()
//        } catch {
//            print("Erro ao salvar pessoa: \(error)")
//        }
//    }
//}
//
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonTableViewCell
//        
//        let person = items[indexPath.row]
//        cell.configure(withName: person.name ?? "")
//        
//        return cell
//    }
//}

class PersonTableViewCell: UITableViewCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        backgroundColor = .black
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withName name: String) {
        nameLabel.text = name
        print(nameLabel.text!)
    }
}


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
    }
    
}


#Preview{ViewController()}
