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
    
}

class CreateGamePresenter: CreateGamePresenterProtocol {
    var gameSettings = GameSetting()
    weak var view: CreateGameViewProtocol?
    var router: RouterProtocol?
    
    required init(view: CreateGameViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func minusButtonForPlayersAmmountTapped() {
        gameSettings.playerAmmount -= 1
        view?.updateUI()
    }
    
    func plusButtonForPlayersAmmountTapped() {
        gameSettings.playerAmmount += 1
        view?.updateUI()
    }
    
    func minusButtonForSpyAmmountTapped() {
        gameSettings.spyAmmount -= 1
        view?.updateUI()
    }
    
    func plusButtonForSpyAmmountTapped() {
        gameSettings.spyAmmount += 1
        view?.updateUI()
    }
    
    func minusButtonForDuringTimeTapped() {
        gameSettings.timeDuring -= 1
        view?.updateUI()
    }
    
    func plusButtonForDuringTimeTapped() {
        gameSettings.timeDuring += 1
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
    }
    
}
