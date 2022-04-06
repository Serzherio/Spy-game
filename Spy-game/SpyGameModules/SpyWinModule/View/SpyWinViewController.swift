//
//  SpyWinViewController.swift
//  Spy-game
//
//  Created by Сергей on 06.04.2022.
//

import UIKit

class SpyWinViewController: UIViewController {
    
    var presenter: SpyWinPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension SpyWinViewController: SpyWinViewProcotol {
    func update() {
    }
    
    
}
