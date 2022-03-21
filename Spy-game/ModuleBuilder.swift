//
//  ModuleBuilder.swift
//  Spy-game
//
//  Created by Сергей on 21.03.2022.
//

import UIKit

protocol ModuleBuilderProtocol: class {
    func createStartScreenModule() -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
    func createStartScreenModule() -> UIViewController {
        let view = StartViewController()
        let presenter = StartScreenPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    
}
