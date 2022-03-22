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
    init(view: StartScreenViewProtocol, router: RouterProtocol)
    func pressStartGameButton()
    func pressShowRulesButton()
    func pressDonateAuthor()
}

class StartScreenPresenter: StartScreenPresenterProtocol {
   
    var router: RouterProtocol?
    weak var view: StartScreenViewProtocol?

    required init(view: StartScreenViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func pressStartGameButton() {
        router?.showCreateGameController()
    }
    
    func pressShowRulesButton() {
        router?.showRulesController()
    }
    
    func pressDonateAuthor() {
        
    }
    
    
}
