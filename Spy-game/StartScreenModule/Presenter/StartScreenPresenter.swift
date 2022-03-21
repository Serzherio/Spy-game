//
//  StartScreenPresenter.swift
//  Spy-game
//
//  Created by Сергей on 21.03.2022.
//

import Foundation

//output protocol for View
protocol StartScreenViewProtocol: class {
    func testFunc()
}

//input protocol for Presenter
protocol StartScreenPresenterProtocol: class {
    init(view: StartScreenViewProtocol)
    func pressStartGameButton()
    func pressShowRulesButton()
    func pressDonateAuthor()
}

class StartScreenPresenter: StartScreenPresenterProtocol {
    
    weak var view: StartScreenViewProtocol?

    required init(view: StartScreenViewProtocol) {
        self.view = view
    }
    
    func pressStartGameButton() {
        
    }
    
    func pressShowRulesButton() {
        
    }
    
    func pressDonateAuthor() {
        
    }
    
    
}
