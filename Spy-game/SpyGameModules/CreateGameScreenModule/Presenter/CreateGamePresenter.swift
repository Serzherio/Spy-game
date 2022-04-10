//
//  CreateGamePresenter.swift
//  Spy-game
//
//  Created by Сергей on 22.03.2022.
//

import Foundation

protocol CreateGameViewProtocol: class {
    func updateUI()

}

protocol CreateGamePresenterProtocol: class {
    var gameSettings: GameSetting {get set}
    init(view: CreateGameViewProtocol, router: RouterProtocol)
    
    func minusButtonForPlayersAmmountTapped()
    func plusButtonForPlayersAmmountTapped()
    func minusButtonForSpyAmmountTapped()
    func plusButtonForSpyAmmountTapped()
    func minusButtonForDuringTimeTapped()
    func plusButtonForDuringTimeTapped()
    func rulesButtonTapped()
    func chooseLocationsButtonTapped()
    func continueButtonTapped()
    
}

class CreateGamePresenter: CreateGamePresenterProtocol {
    var gameSettings = GameSetting()
    weak var view: CreateGameViewProtocol?
    var router: RouterProtocol?
    
    required init(view: CreateGameViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        getPlayersFromDevice()
    }
    
    private func getPlayersFromDevice() {
        let defaults = UserDefaults.standard
        let players = defaults.object(forKey: "players") as? [String]
        gameSettings.players = players ?? []
    }
    
    func minusButtonForPlayersAmmountTapped() {
        if gameSettings.playerAmmount > gameSettings.spyAmmount {
            if gameSettings.playerAmmount == 3 {
                gameSettings.playerAmmount = 3
            } else {
                gameSettings.playerAmmount -= 1
            }
        } else {
            if gameSettings.playerAmmount == 3 {
                gameSettings.playerAmmount = 3
            } else {
                gameSettings.playerAmmount -= 1
                gameSettings.spyAmmount = gameSettings.playerAmmount
            }
        }
        view?.updateUI()
    }
    
    func plusButtonForPlayersAmmountTapped() {
        if gameSettings.playerAmmount == 20 {
            gameSettings.playerAmmount = 20
        } else {
            gameSettings.playerAmmount += 1
        }
        view?.updateUI()
    }
    
    func minusButtonForSpyAmmountTapped() {
        if gameSettings.spyAmmount == 1 {
            gameSettings.spyAmmount = 1
        } else {
            gameSettings.spyAmmount -= 1
        }
        view?.updateUI()
    }
    
    func plusButtonForSpyAmmountTapped() {
        if gameSettings.spyAmmount < gameSettings.playerAmmount {
            if gameSettings.spyAmmount == 20 {
                gameSettings.spyAmmount = 20
            } else {
                gameSettings.spyAmmount += 1
            }
        } else {
            if gameSettings.spyAmmount == 20 {
                gameSettings.spyAmmount = 20
            } else {
                gameSettings.spyAmmount += 1
                gameSettings.playerAmmount = gameSettings.spyAmmount
            }
        }
        view?.updateUI()
    }
    
    func minusButtonForDuringTimeTapped() {
        if gameSettings.timeDuring == 1 {
            gameSettings.timeDuring = 1
        } else {
            gameSettings.timeDuring -= 1
        }
        view?.updateUI()
    }
    
    func plusButtonForDuringTimeTapped() {
        if gameSettings.timeDuring == 20 {
            gameSettings.timeDuring = 20
        } else {
            gameSettings.timeDuring += 1
        }
        view?.updateUI()
    }
    
    func rulesButtonTapped() {
        if gameSettings.roles == false {
            gameSettings.roles = true
        } else {
            gameSettings.roles = false
        }
        view?.updateUI()
    }
    
    func chooseLocationsButtonTapped() {
        router?.showLocationController(gameSetting: gameSettings)
    }
    
    func continueButtonTapped() {
        router?.showAddPlayersController(gameSetting: gameSettings)
    }
    
}
