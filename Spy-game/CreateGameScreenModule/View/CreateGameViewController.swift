//
//  CreateGameController.swift
//  Spy-game
//
//  Created by Сергей on 22.03.2022.
//

import UIKit

class CreateGameViewController: UIViewController {
    
    var presenter: CreateGamePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        
    }
}

extension CreateGameViewController: CreateGameViewProtocol {
    
}
