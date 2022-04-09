//
//  SpyWinPresenter.swift
//  Spy-game
//
//  Created by Сергей on 06.04.2022.
//

import Foundation

protocol SpyWinViewProcotol: class {
    func showSpyPlayersInGame(spy: [String])
}

protocol SpyWinPresenterProtocol: class {
    var gameSetting: GameSetting {get set}
    init(router: RouterProtocol, view: SpyWinViewProcotol, gameSetting: GameSetting, spyPlayers: [String])
    func endGame()
}

class SpyWinPresenter: SpyWinPresenterProtocol {
  
    weak var view: SpyWinViewProcotol?
    var router: RouterProtocol?
    var gameSetting: GameSetting
    var spyPlayers: [String] = []
    
    required init(router: RouterProtocol, view: SpyWinViewProcotol, gameSetting: GameSetting, spyPlayers: [String]) {
        self.view = view
        self.gameSetting = gameSetting
        self.router = router
        self.spyPlayers = spyPlayers
        view.showSpyPlayersInGame(spy: spyPlayers)
    }
    
    func endGame() {
        router?.popToRoot()
    }
    
    
    
}
