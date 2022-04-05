//
//  TimerViewController.swift
//  Spy-game
//
//  Created by Сергей on 05.04.2022.
//

import UIKit

class TimerViewController: UIViewController {
    
    var presenter: TimerPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TimerViewController: TimerViewProcotol {
    func updeteUI() {
        
    }
    
    
}
