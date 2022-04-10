//
//  RulesViewController.swift
//  Spy-game
//
//  Created by Сергей on 22.03.2022.
//

import UIKit

class RulesViewConrtoller: UIViewController {
    
    var presenter: RulesPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: .none, action: .none)
    }
    
}

extension RulesViewConrtoller: RulesViewProtocol {
    
}
