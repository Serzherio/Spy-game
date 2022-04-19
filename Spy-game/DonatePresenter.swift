//
//  DonatePresenter.swift
//  Spy-game
//
//  Created by Сергей on 13.04.2022.
//

import Foundation

protocol DonateViewProtocol: class {
    
}

protocol DonatePresenterProtocol: class {
    init(view: DonateViewProtocol, router: RouterProtocol)
    func closeVC()
}

class DonatePresenter: DonatePresenterProtocol {
    weak var view: DonateViewProtocol?
    var router: RouterProtocol?
    required init(view: DonateViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    func closeVC() {
        router?.popVC()
    }
    
}
