//
//  GameSettingModel.swift
//  Spy-game
//
//  Created by Сергей on 22.03.2022.
//

import Foundation

class GameSetting {
    var playerAmmount: Int = 4
    var spyAmmount: Int = 1
    var timeDuring: Int = 5
    var roles: Bool = false
    var selectedLocations: [String] = ["Базовые"]
    var players: [String] = ["Юля", "Юса", "Я", "Сергей"]
    var locations : [String:[String]] = ["Базовые":Locations().main, "18+":Locations().sex]
}

struct Locations {
    let main:[String] = ["База терротистов","Банк","Больница","Воинская часть","Казино","Овощебаза","Океанский лайнер","МКС","Отель","Поезд", "Пляж","Полдводная лодка","Цирк","Школа","Церковь","Ресторан","Магазин"]
    let sex:[String] = ["Бордель","Шлюхи","Уроды"]
    
}
