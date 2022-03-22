//
//  CreateGamePresenter.swift
//  Spy-game
//
//  Created by Сергей on 22.03.2022.
//

import Foundation

protocol CreateGameViewProtocol: class {
    
}

protocol CreateGamePresenterProtocol: class {
    init(view: CreateGameViewProtocol, router: RouterProtocol)
}

class CreateGamePresenter: CreateGamePresenterProtocol {
    
    weak var view: CreateGameViewProtocol?
    var router: RouterProtocol?
    
    required init(view: CreateGameViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }

    
}
