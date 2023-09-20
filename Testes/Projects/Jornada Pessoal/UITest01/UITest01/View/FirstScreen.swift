//
//  ViewController.swift
//  UITest01
//
//  Created by Jairo Júnior on 11/09/23.
//
import UserNotifications
import UIKit

class FirstScreen: UIViewController {

    let button = UIButton()
    var qtd:Int = 0

    let myView3 = UIView()
    let myView4 = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUp()
        squares()
        title = "First Screen"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { _, _ in
            DispatchQueue.main.asyncAfter(deadline: .now()+4) {
                self.scheduleNotification()
            }
        }
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first!
        if touch.view == myView3{
            if view.backgroundColor == .blue{
                view.backgroundColor = .systemBackground
            }else{
                view.backgroundColor = .blue
            }
        }else if touch.view == myView4{
            if view.backgroundColor == .yellow{
                view.backgroundColor = .systemBackground
            }else{
                view.backgroundColor = .yellow
            }
        }
    }
    
    func squares(){
        let myView = UIView(frame: CGRect(x: 50, y: 200, width: 200, height: 100))
        myView.backgroundColor = .blue
        myView.isAccessibilityElement = true
        myView.accessibilityHint = "Fuck You"
    
        let myView2 = UIView(frame: CGRect(x: 50, y: 40, width: 200, height: 100))
        myView2.isAccessibilityElement = true
        myView2.accessibilityHint = "Fuck You Too"

        myView2.backgroundColor = .darkGray
        myView2.alpha = 0.8

                
        myView3.frame = CGRect(x: 70, y: 500, width: 50, height: 50)
        myView3.backgroundColor = .blue
        myView3.isAccessibilityElement = true
        myView3.accessibilityHint = "Fuck You Three"

        myView3.clipsToBounds = false

    
        myView4.frame = CGRect(x: 40, y: 550, width: 50, height: 50)
        myView4.backgroundColor = .yellow
        myView4.isAccessibilityElement = true
        myView4.accessibilityHint = "Fuck You Four"

       
        view.addSubview(myView)
        myView.addSubview(myView2)
        view.addSubview(myView3)
        view.addSubview(myView4)
    }
    
    func setUp(){
        
        view.addSubview(button)
        
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .red
        button.configuration?.title = "Next View"
        
        button.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func goToNextScreen(){
        let nextScreen = SecondScreen()
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
   
}


