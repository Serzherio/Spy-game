//
//  Router.swift
//  Spy-game
//
//  Created by Сергей on 21.03.2022.
//

import Foundation
import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? {get set}
    var moduleBuilder: ModuleBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDonateController()
    func showCreateGameController()
    func showRulesController()
    func showLocationController(gameSetting: GameSetting)
    func showAddPlayersController(gameSetting: GameSetting)
    func showReadyStartGameController(gameSetting: GameSetting, spyPlayers: [String])
    func showSpyGameController(gameSetting: GameSetting)
    func showTimerController(gameSetting: GameSetting, spyPlayers: [String])
    func showSpyWinController(gameSetting: GameSetting, spyPlayers: [String])
    func showStopTimerController(gameSetting: GameSetting, spyPlayers: [String])
    func showEndGameController(gameSetting: GameSetting, spyPlayers: [String])
    func popVC()
    func popToRoot()
}

class Router: RouterProtocol {

    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilderProtocol?
    
    init(navigationController: UINavigationController, moduleBuilder: ModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let startScreenViewController = moduleBuilder?.createStartScreenModule(router: self) else {return}
            navigationController.viewControllers = [startScreenViewController]
        }
    }
    
    func showDonateController() {
        if let navigationController = navigationController {
            guard let donateVC = moduleBuilder?.createDonateModule(router: self) else {return}
            navigationController.pushViewController(donateVC, animated: true)
        }
    }
    
    func showCreateGameController() {
        if let navigationController = navigationController {
            guard let createGameVC = moduleBuilder?.createGameModule(router: self) else {return}
            navigationController.pushViewController(createGameVC, animated: true)
        }
    }
    
    func showRulesController() {
        if let navigationController = navigationController {
            guard let rulesVC = moduleBuilder?.createRulesModule(router: self) else {return}
            navigationController.pushViewController(rulesVC, animated: true)
        }
    }
    
    func showLocationController(gameSetting: GameSetting) {
        if let navigationController = navigationController {
            guard let locationVC = moduleBuilder?.createLocationModule(router: self, gameSetting: gameSetting) else {return}
            navigationController.pushViewController(locationVC, animated: true)
        }
    }
    
    func showAddPlayersController(gameSetting: GameSetting) {
        if let navigationController = navigationController {
            guard let addPlayersVC = moduleBuilder?.createAddPlayersModule(router: self, gameSetting: gameSetting) else {return}
            navigationController.pushViewController(addPlayersVC, animated: true)
        }
    }
    
    func showReadyStartGameController(gameSetting: GameSetting, spyPlayers: [String]) {
        if let navigationController = navigationController {
            guard let startGameVC = moduleBuilder?.createReadyStartGameModule(router: self, gameSetting: gameSetting, spyPlayers: spyPlayers) else {return}
            navigationController.pushViewController(startGameVC, animated: true)
        }
    }
    
    func showSpyGameController(gameSetting: GameSetting) {
        if let navigationController = navigationController {
            guard let spyGameVC = moduleBuilder?.createSpyGameMainModule(router: self, gameSetting: gameSetting) else {return}
            navigationController.pushViewController(spyGameVC, animated: true)
        }
    }
    
    func showTimerController(gameSetting: GameSetting, spyPlayers: [String]) {
        if let navigationController = navigationController {
            guard let timerVC = moduleBuilder?.createTimerGameModule(router: self, gameSetting: gameSetting, spyPlayers: spyPlayers) else {return}
            navigationController.pushViewController(timerVC, animated: true)
        }
    }
    func showSpyWinController(gameSetting: GameSetting, spyPlayers: [String]) {
        if let navigationController = navigationController {
            guard let spyWinVC = moduleBuilder?.createSpyWinGameModule(router: self, gameSetting: gameSetting, spyPlayers: spyPlayers) else {return}
            navigationController.pushViewController(spyWinVC, animated: true)
        }
    }
    func showStopTimerController(gameSetting: GameSetting, spyPlayers: [String]) {
        if let navigationController = navigationController {
            guard let stopTimerVC = moduleBuilder?.createStopTimerController(router: self, gameSetting: gameSetting, spyPlayers: spyPlayers) else {return}
            navigationController.pushViewController(stopTimerVC, animated: true)
        }
    }
    
    func showEndGameController(gameSetting: GameSetting, spyPlayers: [String]) {
        if let navigationController = navigationController {
            guard let endGameVC = moduleBuilder?.createEndGameController(router: self, gameSetting: gameSetting, spyPlayers: spyPlayers) else {return}
            navigationController.pushViewController(endGameVC, animated: true)
        }
    }
    
    
    func popVC() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }

    
    
}
