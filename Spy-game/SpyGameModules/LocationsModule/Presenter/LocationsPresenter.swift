//
//  Presenter.swift
//  Spy-game
//
//  Created by Сергей on 24.03.2022.
//

import Foundation


protocol LocationViewProtocol: class {
    func updateUI()
}

protocol LocationPresenterProtocol: class {
    var gameSetting: GameSetting {get set}
    init(view: LocationViewProtocol, router: RouterProtocol, gameSetting: GameSetting)
    func selectLocation(location: String)
    func saveButtonPressed()
}

class LocationPresenter: LocationPresenterProtocol {

    weak var view: LocationViewProtocol?
    var gameSetting: GameSetting
    var router: RouterProtocol?
    
    required init(view: LocationViewProtocol, router: RouterProtocol, gameSetting: GameSetting) {
        self.gameSetting = gameSetting
        self.view = view
        self.router = router
    }
    
    func selectLocation(location: String) {
        
        if !gameSetting.selectedLocations.contains(location) {
            gameSetting.selectedLocations.append(location)
        } else {
            guard let removeIndex = gameSetting.selectedLocations.firstIndex(of: location) else {return}
            gameSetting.selectedLocations.remove(at: removeIndex)
        }
        view?.updateUI()
        
//        let newLocation = gameSetting.locations[index]
//        if !gameSetting.selectedLocations.contains(newLocation) {
//            gameSetting.selectedLocations.append(newLocation)
//        } else {
//            guard let removeIndex = gameSetting.selectedLocations.firstIndex(of: newLocation) else {return}
//            gameSetting.selectedLocations.remove(at: removeIndex)
//        }
//        print(gameSetting.selectedLocations)
//        view?.updateUI()
    }
    
    func saveButtonPressed() {
        router?.popVC()
    }
    
    
    
}
