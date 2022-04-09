//
//  AddPlayersPresenter.swift
//  Spy-game
//
//  Created by Сергей on 30.03.2022.
//

import Foundation


protocol AddPlayersViewProtocol: class {
    func newPlayerAdded()
    func disableContinueButton()
    func enableContinueButton()
}

protocol AddPlayersPresenterProtocol: class {
    init(view: AddPlayersViewProtocol, router: RouterProtocol, gameSettings: GameSetting)
    func addNewPlayer(player: String)
    func deletePlayer(index: Int)
    func startGame()
    var gameSettings: GameSetting { get set}
}

class AddPlayersPresenter: AddPlayersPresenterProtocol {
   

    weak var view: AddPlayersViewProtocol?
    var router: RouterProtocol?
    var gameSettings: GameSetting
    
    required init(view: AddPlayersViewProtocol, router: RouterProtocol, gameSettings: GameSetting) {
        self.view = view
        self.router = router
        self.gameSettings = gameSettings
        checkPlayersAmmount()
    }
    
    func addNewPlayer(player: String) {
        gameSettings.players.append(player)
        view?.newPlayerAdded()
        checkPlayersAmmount()
    }
    
    func deletePlayer(index: Int) {
        gameSettings.players.remove(at: index)
        checkPlayersAmmount()
    }
    
    func startGame() {
        router?.showSpyGameController(gameSetting: gameSettings)
    }
    
    
    private func checkPlayersAmmount() {
        if gameSettings.playerAmmount != gameSettings.players.count {
            view?.disableContinueButton()
        } else {
            view?.enableContinueButton()
        }
    }
    
    
    
}
