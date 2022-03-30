//
//  GameSettingModel.swift
//  Spy-game
//
//  Created by Сергей on 22.03.2022.
//

import Foundation

class GameSetting {
    var playerAmmount: Int = 8
    var spyAmmount: Int = 1
    var timeDuring: Int = 5
    var roles: Bool = false
    var locations: [String] = ["11","12"]
    var selectedLocations: [String] = ["11"]
}
