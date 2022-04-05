//
//  TimerPresenter.swift
//  Spy-game
//
//  Created by Сергей on 05.04.2022.
//

import Foundation

protocol TimerViewProcotol: class {
    func updeteUI()
}

protocol TimerPresenterProtocol: class {
    var gameSetting: GameSetting {get set}
    init(router: RouterProtocol, view: TimerViewProcotol, gameSetting: GameSetting)
}

class TimerPresenter: TimerPresenterProtocol {

    weak var view: TimerViewProcotol?
    var router: RouterProtocol?
    var gameSetting: GameSetting
    
    required init(router: RouterProtocol, view: TimerViewProcotol, gameSetting: GameSetting) {
        self.router = router
        self.view = view
        self.gameSetting = gameSetting
    }
    
    
}


