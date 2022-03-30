//
//  StartGamePresenter.swift
//  Spy-game
//
//  Created by Сергей on 30.03.2022.
//

import Foundation

protocol StartGameViewProtocol: class {
    func updateUI()
}

protocol StartGamePresenterProtocol: class {
    var gameSetting: GameSetting {get set}
    init(view: StartGameViewProtocol, router: RouterProtocol, gameSetting: GameSetting)
    func showNextPlayer()
}

class StartGamePresenter: StartGamePresenterProtocol {
    weak var view: StartGameViewProtocol?
    var router: RouterProtocol?
    var gameSetting : GameSetting
    
    required init(view: StartGameViewProtocol, router: RouterProtocol, gameSetting: GameSetting) {
        self.view = view
        self.router = router
        self.gameSetting = gameSetting
    }
    
    func showNextPlayer() {
        
    }
    
    
}
