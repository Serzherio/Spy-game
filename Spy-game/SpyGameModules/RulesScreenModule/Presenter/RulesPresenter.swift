//
//  Presenter.swift
//  Spy-game
//
//  Created by Сергей on 22.03.2022.
//

import Foundation


protocol RulesViewProtocol: class {
    
}

protocol RulesPresenterProtocol: class {
    init(view: RulesViewProtocol, router: RouterProtocol)
    func closeVC()
}

class RulesPresenter: RulesPresenterProtocol {
    
    weak var view: RulesViewProtocol?
    var router: RouterProtocol?
    
    required init(view: RulesViewProtocol, router: RouterProtocol) {
        self.router = router
        self.view = view
    }
    
    func closeVC() {
        router?.popVC()
    }
    
}
