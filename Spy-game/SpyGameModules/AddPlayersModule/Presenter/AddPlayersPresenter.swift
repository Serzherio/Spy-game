//
//  AddPlayersPresenter.swift
//  Spy-game
//
//  Created by Сергей on 30.03.2022.
//

import Foundation


protocol AddPlayersViewProtocol: class {
    func updateUI()
    func newPlayerAdded()
    func deletePlayer(index: Int)
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
        print(gameSettings.players)
    }
    
    func addNewPlayer(player: String) {
        gameSettings.players.append(player)
        view?.newPlayerAdded()
    }
    
    func deletePlayer(index: Int) {
        gameSettings.players.remove(at: index)
    }
    
    func startGame() {
        router?.showSpyGameController(gameSetting: gameSettings)
        
    }
    
    
    
}
