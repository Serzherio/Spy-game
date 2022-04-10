//
//  ReadyStartGamePresenter.swift
//  Spy-game
//
//  Created by Сергей on 10.04.2022.
//

import Foundation

protocol ReadyStartViewProtocol: class {
    
}

protocol ReadyStartPresenterProtocol: class {
    var gameSetting: GameSetting {get set}
    init(view: ReadyStartViewProtocol,  router: RouterProtocol, gameSetting: GameSetting, spyPlayers: [String])
    func startGame()
}

class ReadyStartGamePresenter: ReadyStartPresenterProtocol {
    
    weak var view: ReadyStartViewProtocol?
    var router: RouterProtocol?
    var gameSetting: GameSetting
    var spyPlayers: [String] = []

    required init(view: ReadyStartViewProtocol, router: RouterProtocol, gameSetting: GameSetting, spyPlayers: [String]) {
        self.view = view
        self.gameSetting = gameSetting
        self.router = router
        self.spyPlayers = spyPlayers
    }
    
    func startGame() {
        router?.showTimerController(gameSetting: gameSetting, spyPlayers: spyPlayers)
    }
    
}
