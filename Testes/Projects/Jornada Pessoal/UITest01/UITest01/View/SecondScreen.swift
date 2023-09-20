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

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonToChange.isAccessibilityElement = true
        buttonToChange.accessibilityHint = "It's a button that change the color of the screen, but if you are blind it does'nt matter"
        view.backgroundColor = .systemPink 
        title = "Second Screen"
        navigationController?.navigationBar.prefersLargeTitles = true

        buttonToChangeColor()
        
        

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
}
