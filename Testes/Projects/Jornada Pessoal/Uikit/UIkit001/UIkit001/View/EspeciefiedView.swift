//
//  EspeciefiedView.swift
//  UIkit001
//
//  Created by Jairo Júnior on 20/09/23.
//

import SwiftUI

class EspeciefiedView: UIViewController{
    let name: String
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = name
    }
}
