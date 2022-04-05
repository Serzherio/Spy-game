//
//  ModuleBuilder.swift
//  Spy-game
//
//  Created by Сергей on 21.03.2022.
//

import UIKit

protocol ModuleBuilderProtocol: class {
    func createStartScreenModule(router: RouterProtocol) -> UIViewController
    func createGameModule(router: RouterProtocol) -> UIViewController
    func createRulesModule(router: RouterProtocol) -> UIViewController
    func createLocationModule(router: RouterProtocol, gameSetting: GameSetting) -> UIViewController
    func createAddPlayersModule(router: RouterProtocol, gameSetting: GameSetting) -> UIViewController
    func createSpyGameMainModule(router: RouterProtocol, gameSetting: GameSetting) -> UIViewController
    func createTimerGameModule(router: RouterProtocol, gameSetting: GameSetting) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {

    func createStartScreenModule(router: RouterProtocol) -> UIViewController {
        let view = StartViewController()
        let presenter = StartScreenPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createGameModule(router: RouterProtocol) -> UIViewController {
        let view = CreateGameViewController()
        let presenter = CreateGamePresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createRulesModule(router: RouterProtocol) -> UIViewController {
        let view = RulesViewConrtoller()
        let presenter = RulesPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    func createLocationModule(router: RouterProtocol, gameSetting: GameSetting) -> UIViewController {
        let view = LocationsViewController()
        let presenter = LocationPresenter(view: view, router: router, gameSetting: gameSetting)
        view.presenter = presenter
        return view
    }
    
    func createAddPlayersModule(router: RouterProtocol, gameSetting: GameSetting) -> UIViewController {
        let view = AddPlayersViewController()
        let presenter = AddPlayersPresenter(view: view, router: router, gameSettings: gameSetting)
        view.presenter = presenter
        return view
    }
    

    
    func createSpyGameMainModule(router: RouterProtocol, gameSetting: GameSetting) -> UIViewController {
        let view = SpyGameViewController()
        let presenter = SpyGamePresenter(view: view, router: router, gameSetting: gameSetting)
        view.presenter = presenter
        return view
    }
    
    func createTimerGameModule(router: RouterProtocol, gameSetting: GameSetting) -> UIViewController {
        let view = TimerViewController()
        let presenter = TimerPresenter(router: router, view: view, gameSetting: gameSetting )
        view.presenter = presenter
        return view
    }
    
    
}
