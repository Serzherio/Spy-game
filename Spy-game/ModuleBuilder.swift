//
//  ModuleBuilder.swift
//  Spy-game
//
//  Created by Сергей on 21.03.2022.
//

import UIKit

protocol ModuleBuilderProtocol: class {
    func createStartScreenModule(router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
    func createStartScreenModule(router: RouterProtocol) -> UIViewController {
        let view = StartViewController()
        let presenter = StartScreenPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    
}
