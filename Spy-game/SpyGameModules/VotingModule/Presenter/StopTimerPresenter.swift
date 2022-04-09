//
//  StopTimerPresenter.swift
//  Spy-game
//
//  Created by Сергей on 07.04.2022.
//

import Foundation

protocol StopTimerViewProtocol: class {
    func lol(spyAmmount: Int)
}

protocol StopTimerPresenterProtocol: class {
    var gameSetting: GameSetting {get set}
    init(view: StopTimerViewProtocol,  router: RouterProtocol, gameSetting: GameSetting, spyPlayers: [String])
    func closeVoting()
}

class StopTimerPresenter: StopTimerPresenterProtocol {
    
    weak var view: StopTimerViewProtocol?
    var router: RouterProtocol?
    var gameSetting: GameSetting
    var spyPlayers: [String] = []

    
    required init(view: StopTimerViewProtocol, router: RouterProtocol, gameSetting: GameSetting, spyPlayers: [String]) {
        self.view = view
        self.gameSetting = gameSetting
        self.router = router
        self.spyPlayers = spyPlayers
        view.lol(spyAmmount: gameSetting.spyAmmount)
    }
    
    func closeVoting() {
        router?.showEndGameController(gameSetting: gameSetting, spyPlayers: spyPlayers)
    }
    
    
}
