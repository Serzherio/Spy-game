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
    func createStartGameModule(router: RouterProtocol, gameSetting: GameSetting) -> UIViewController
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
    func createStartGameModule(router: RouterProtocol, gameSetting: GameSetting) -> UIViewController {
        let view = StartGameViewController()
        let presenter = StartGamePresenter(view: view, router: router, gameSetting: gameSetting)
        view.presenter = presenter
        return view
    }
    
}
