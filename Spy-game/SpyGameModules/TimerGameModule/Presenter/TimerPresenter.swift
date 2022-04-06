//
//  TimerPresenter.swift
//  Spy-game
//
//  Created by Сергей on 05.04.2022.
//

import Foundation

protocol TimerViewProcotol: class {
    func tickTimer(secondsToEnd: Int)
}

protocol TimerPresenterProtocol: class {
    var gameSetting: GameSetting {get set}
    init(router: RouterProtocol, view: TimerViewProcotol, gameSetting: GameSetting)
}

class TimerPresenter: TimerPresenterProtocol {

    weak var view: TimerViewProcotol?
    var router: RouterProtocol?
    var gameSetting: GameSetting
    
    var timeToEndGame: Int
    var timer = Timer()
    
    required init(router: RouterProtocol, view: TimerViewProcotol, gameSetting: GameSetting) {
        self.router = router
        self.view = view
        self.gameSetting = gameSetting
        self.timeToEndGame = gameSetting.timeDuring * 60
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tickTime), userInfo: nil, repeats: true)
    }
    
    @objc private func tickTime() {
        timeToEndGame -= 1
        if timeToEndGame >= 0 {
            view?.tickTimer(secondsToEnd: timeToEndGame)
        } else {
            timer.invalidate()
            print("Stop")
        }
     
        print("tick")
    }
    
    
}


