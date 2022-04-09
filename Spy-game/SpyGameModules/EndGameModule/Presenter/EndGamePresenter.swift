//
//  EndGamePresenter.swift
//  Spy-game
//
//  Created by Сергей on 08.04.2022.
//

import Foundation

protocol EndGameViewProtocol: class {
    func showSpies(spy: [String])
}

protocol EndGamePresenterProtocol: class {
    var gameSetting: GameSetting {get set}
    init(view: EndGameViewProtocol, router: RouterProtocol, gameSetting: GameSetting, spyPlayersArray: [String])
    func endGame()
}

class EndGamePresenter: EndGamePresenterProtocol {
    weak var view: EndGameViewProtocol?
    var router: RouterProtocol?
    var gameSetting: GameSetting
    var spyPlayersArray: [String]
    
    required init(view: EndGameViewProtocol, router: RouterProtocol, gameSetting: GameSetting, spyPlayersArray: [String]) {
        self.view = view
        self.router = router
        self.gameSetting = gameSetting
        self.spyPlayersArray = spyPlayersArray
        view.showSpies(spy: spyPlayersArray)
    }
    
    func endGame() {
        router?.popToRoot()
    }
    
}
