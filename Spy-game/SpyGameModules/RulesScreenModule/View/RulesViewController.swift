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
    }
    
}

extension RulesViewConrtoller: RulesViewProtocol {
    
}
