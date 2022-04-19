//
//  DonateViewController.swift
//  Spy-game
//
//  Created by Сергей on 13.04.2022.
//

import Foundation

class DonateViewController: UIViewController {
    
    var presenter: DonatePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 213/255, green: 46/255, blue: 46/255, alpha: 1)
    }
    
}

extension DonateViewController: DonateViewProtocol {
    
}

