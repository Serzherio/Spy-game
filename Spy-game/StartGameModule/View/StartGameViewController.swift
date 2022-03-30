//
//  StartGameModule.swift
//  Spy-game
//
//  Created by Сергей on 30.03.2022.
//

import UIKit

class StartGameViewController: UIViewController {
    
    var presenter: StartGamePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}

extension StartGameViewController: StartGameViewProtocol {
    func updateUI() {
    
    }
    
    
}
