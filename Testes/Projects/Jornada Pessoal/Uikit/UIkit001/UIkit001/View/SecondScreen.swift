//
//  SecondScreenViewController.swift
//  UITest01
//
//  Created by Jairo Júnior on 11/09/23.
//

import UIKit

class SecondScreen: UIViewController {
    var testToggle = false
    let buttonToChange = UIButton()
    var labelVazia = UILabel()
    var qtd: Int = 0

    
    let myView3 = UIView()
    let myView4 = UIView()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonToChange.isAccessibilityElement = true
        buttonToChange.accessibilityHint = "It's a button that change the color of the screen, but if you are blind it does'nt matter"
        view.backgroundColor = .systemPink
        title = "Second Screen"
        navigationController?.navigationBar.prefersLargeTitles = true

        buttonToChangeColor()
        squares()
        

    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch = touches.first!
        let location = touch.location(in: view)
        
            buttonToChange.frame.origin = location
    }
    
    
    @objc func changeColor(){
        self.view.backgroundColor = testToggle == true ? .red : .blue
        testToggle.toggle()
    }
    
    func buttonToChangeColor(){
        view.addSubview(buttonToChange)
        buttonToChange.translatesAutoresizingMaskIntoConstraints = false
        buttonToChange.configuration = .filled()
        buttonToChange.configuration?.baseBackgroundColor = .white
        buttonToChange.configuration?.title = ""
        buttonToChange.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        buttonToChange.alpha = 0.3
        
        NSLayoutConstraint.activate([
            buttonToChange.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonToChange.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonToChange.widthAnchor.constraint(equalToConstant: 50),
            buttonToChange.heightAnchor.constraint(equalToConstant: 50)
        ])
        
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
}
