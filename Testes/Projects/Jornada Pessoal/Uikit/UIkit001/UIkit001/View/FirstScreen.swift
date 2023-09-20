//
//  ViewController.swift
//  UITest01
//
//  Created by Jairo Júnior on 11/09/23.
//
import UserNotifications
import UIKit
import CoreData

class FirstScreen: UIViewController{
    
    
    
    lazy var tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.isScrollEnabled = false
        tableview.delegate = self
        tableview.dataSource = self
        
        return tableview
    }()

    let button = UIButton()
    let button2 = UIButton()
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
        
        //self.view.addSubview(self.tableView)
        view.backgroundColor = .systemBackground
        
        title = "First Screen"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { _, _ in
            DispatchQueue.main.asyncAfter(deadline: .now()+4) {
                self.scheduleNotification()
            }
        }
        self.configConstrains()
    }
    
    func configConstrains(){
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

        ])
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
            _ = alert.textFields![0]
            print(self.itens?.count ?? 0)
            
        }
        
        alert.addAction(submitButton)
        self.present(alert, animated: true, completion: nil)
         
    }
    
    
    func scheduleNotification(){
        //Content
        let content = UNMutableNotificationContent()
        content.title = "Notificação da vida"
        content.body = "Go ahead and try to do something usable my friend, hehe"
        content.interruptionLevel = UNNotificationInterruptionLevel.timeSensitive
        //Trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        //Request
        let request = UNNotificationRequest(identifier: "NotificationTest", content: content, trigger: trigger)
        //Schedule request
        UNUserNotificationCenter.current().add(request){error in
            if let error = error{
                print(error)
            }else{
                print("Success")
            }
        }
    }
    
    
    func setUp(){
        
        view.addSubview(button)
        
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .red
        button.configuration?.title = "Add Person"
        
        button.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        /////
        view.addSubview(button2)
        
        button2.configuration = .filled()
        button2.configuration?.baseBackgroundColor = .red
        button2.configuration?.title = "Next View"
        
        button2.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 350),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            
           
            self.button2.leadingAnchor.constraint(equalTo: self.button.trailingAnchor, constant: 20),
            button2.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            button2.widthAnchor.constraint(equalToConstant: 100),
            button2.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func goToNextScreen(){
        let nextScreen = SecondScreen()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
   
}


extension FirstScreen:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        let person = self.itens![indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}


#Preview{FirstScreen()}
