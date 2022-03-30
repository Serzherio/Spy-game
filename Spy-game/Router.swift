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
    func showCreateGameController()
    func showRulesController()
    func showDonateController()
    func showLocationController(gameSetting: GameSetting)
    func showStartGameController(gameSetting: GameSetting)
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
    func showStartGameController(gameSetting: GameSetting) {
        if let navigationController = navigationController {
            guard let startGameVC = moduleBuilder?.createStartGameModule(router: self, gameSetting: gameSetting) else {return}
            navigationController.pushViewController(startGameVC, animated: true)
        }
    }
    
    
    func showDonateController() {
        
    }
    
    func popVC() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    
    
    func popToRoot() {
        
    }

    
    
}
