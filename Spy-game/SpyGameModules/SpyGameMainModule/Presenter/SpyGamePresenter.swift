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
    func showNextPlayerOnScreen(randomSelectedLocation: String, location: String, isRolePlay: Bool, roleForPlay: String, player: Dictionary<String,Bool>.Element)
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
    var roleForPlay: String = ""
    var spyPlayersArray: [String] = []
    var prepareForShowPlayerRoleFlag: Bool = true
    var randomSelectedLocation: String = ""
    
    
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
        randomSelectedLocation = selectedLocations.randomElement() ?? "Ошибка"
        guard let locationsForGame = gameSetting.locations[randomSelectedLocation] else {return}
        locationForGame = locationsForGame.randomElement() ?? "Ошибка"
        
    }
    
    private func setRandomSpyInPlayers() {
        var allPlayersDictionary: [String: Bool] = [:]
        var playersArray = gameSetting.players
        for _ in 1...gameSetting.spyAmmount {
            guard let spy = playersArray.randomElement() else {return}
            spyPlayersArray.append(spy)
            playersArray.remove(at: playersArray.firstIndex(of: spy)!)
        }
        let playersDictionary = Dictionary(grouping: playersArray) { $0 }.mapValues { _ in false }
        let spyDictionary = Dictionary(grouping: spyPlayersArray) { $0 }.mapValues { _ in true }
        
        allPlayersDictionary.merge(other: playersDictionary)
        allPlayersDictionary.merge(other: spyDictionary)
        players = allPlayersDictionary.shuffled()
    }
    
    private func setRandomRoleForPlay() {
        let allRoles = Roles()
        switch locationForGame {
        case "Отель": roleForPlay = allRoles.hotelRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        case "Больница": roleForPlay = allRoles.hospitalRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        case "Пиратский корабль": roleForPlay = allRoles.boatRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        case "Полицейский участок": roleForPlay = allRoles.policeRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        case "Театр": roleForPlay = allRoles.theaterRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        case "Школа": roleForPlay = allRoles.schoolRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        case "Магазин": roleForPlay = allRoles.marketRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        case "Подводная лодка": roleForPlay = allRoles.underwaterBoatRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        case "Университет": roleForPlay = allRoles.universityRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        case "Церковь": roleForPlay = allRoles.churchRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        case "Казино": roleForPlay = allRoles.casinoRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        case "Пляж": roleForPlay = allRoles.beachRoles.randomElement() ?? "Роли доступны только в наборе Базовые"
        default:
            roleForPlay = "Роли доступны только в наборе Базовые"
        }
        print(roleForPlay)
    }

    
    func showNextPlayer() {
        if playersCounter != 0 {
            if prepareForShowPlayerRoleFlag == true {
                view?.prepareToShowNextPlayer(player: players[playersCounter - 1].key)
                prepareForShowPlayerRoleFlag = false
            } else {
                setRandomRoleForPlay()
                view?.showNextPlayerOnScreen(randomSelectedLocation: randomSelectedLocation, location: locationForGame, isRolePlay: gameSetting.roles, roleForPlay: roleForPlay, player: players[playersCounter - 1])
                playersCounter -= 1
                prepareForShowPlayerRoleFlag = true
            }
        } else {
            router?.showReadyStartGameController(gameSetting: gameSetting, spyPlayers: spyPlayersArray)
        }
    

    }
    
    

    
}
