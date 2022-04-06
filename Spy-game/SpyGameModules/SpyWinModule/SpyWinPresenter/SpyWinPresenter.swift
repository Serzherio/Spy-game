//
//  SpyWinPresenter.swift
//  Spy-game
//
//  Created by Сергей on 06.04.2022.
//

import Foundation

protocol SpyWinViewProcotol: class {
    func update()
}

protocol SpyWinPresenterProtocol: class {
    var gameSetting: GameSetting {get set}
    init(router: RouterProtocol, view: SpyWinViewProcotol, gameSetting: GameSetting)
}

class SpyWinPresenter: SpyWinPresenterProtocol {
    
    weak var view: SpyWinViewProcotol?
    var router: RouterProtocol?
    var gameSetting: GameSetting
    
    required init(router: RouterProtocol, view: SpyWinViewProcotol, gameSetting: GameSetting) {
        self.view = view
        self.gameSetting = gameSetting
        self.router = router
    }
    
    
}
