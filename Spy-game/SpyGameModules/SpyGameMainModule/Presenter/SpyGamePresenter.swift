//
//  SpyGamePresenter.swift
//  Spy-game
//
//  Created by Сергей on 03.04.2022.
//

import Foundation


protocol SpyGameViewProtocol: class {
    func updateUI()
    func prepareToShowNextPlayer(player: String)
    func showNextPlayerOnScreen(location: String, isRolePlay: Bool, player: Dictionary<String,Bool>.Element)
}

protocol SpyGamePresenterProtocol: class {
    var gameSetting: GameSetting {get set}
    init(view: SpyGameViewProtocol, router: RouterProtocol, gameSetting: GameSetting)
    func showNextPlayer()
}

class SpyGamePresenter: SpyGamePresenterProtocol {

    weak var view: SpyGameViewProtocol?
    var router: RouterProtocol?
    var gameSetting: GameSetting
    
    var players:[Dictionary<String,Bool>.Element] = []
    var playersCounter: Int
    var locationForGame: String = ""
    var prepareForShowPlayerRoleFlag: Bool = true
    
    required init(view: SpyGameViewProtocol, router: RouterProtocol, gameSetting: GameSetting) {
        self.view = view
        self.router = router
        self.gameSetting = gameSetting
        self.playersCounter = gameSetting.playerAmmount
        self.setRandomSpyInPlayers()
        self.setRandomLocation()
        self.showNextPlayer()
    }
    
    private func setRandomLocation() {
        let selectedLocations = gameSetting.selectedLocations
        guard let randomSelectedLocation = selectedLocations.randomElement() else {return}
        guard let locationsForGame = gameSetting.locations[randomSelectedLocation] else {return}
        locationForGame = locationsForGame.randomElement() ?? "Ошибка"
        
    }
    
    private func setRandomSpyInPlayers() {
        var allPlayersDictionary: [String: Bool] = [:]
        var playersArray = gameSetting.players
        var spyArray: [String] = []
        for _ in 1...gameSetting.spyAmmount {
            guard let spy = playersArray.randomElement() else {return}
            spyArray.append(spy)
            playersArray.remove(at: playersArray.firstIndex(of: spy)!)
        }
        let playersDictionary = Dictionary(grouping: playersArray) { $0 }.mapValues { _ in false }
        let spyDictionary = Dictionary(grouping: spyArray) { $0 }.mapValues { _ in true }
        
        allPlayersDictionary.merge(other: playersDictionary)
        allPlayersDictionary.merge(other: spyDictionary)
        players = allPlayersDictionary.shuffled()
    }

    
    func showNextPlayer() {
        if playersCounter != 0 {
            if prepareForShowPlayerRoleFlag == true {
                view?.prepareToShowNextPlayer(player: players[playersCounter - 1].key)
                prepareForShowPlayerRoleFlag = false
            } else {
                view?.showNextPlayerOnScreen(location: locationForGame, isRolePlay: gameSetting.roles, player: players[playersCounter - 1])
                playersCounter -= 1
                prepareForShowPlayerRoleFlag = true
            }
        } else {
            router?.showTimerController(gameSetting: gameSetting)
        }
    
      
        
    }
    
    

    
}
