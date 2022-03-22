//
//  CreateGameController.swift
//  Spy-game
//
//  Created by Сергей on 22.03.2022.
//

import UIKit

class CreateGameViewController: UIViewController {
    
    //UI elements
    let titleSettingLabel = UILabel(textLabel: "Настройки игры", font: .noteworthy50()!)
    let spyLabel = UILabel(textLabel: "Шпионы", font: .noteworthy24()!)
    let spyDescriptionLabel = UILabel(textLabel: "1", font: .noteworthy24()!)
    let minusButton = UIButton(type: .system)
    let plusButton = UIButton(type: .system)
    
    // variables
    var presenter: CreateGamePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)
//        self.view.backgroundColor = .systemRed
        design()
    }
    
    private func design() {
        minusButton.setImage(UIImage(named: "MinusAction"), for: .normal)
        plusButton.setImage(UIImage(named: "PlusAction"), for: .normal)
        let chooseSpyAmountInGameView = ViewWithLabelAndButtons(headLabel: spyLabel, descriptionLabel: spyDescriptionLabel, buttons: [minusButton, plusButton])
        self.view.addSubview(chooseSpyAmountInGameView)
        NSLayoutConstraint.activate([
            chooseSpyAmountInGameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseSpyAmountInGameView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chooseSpyAmountInGameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            chooseSpyAmountInGameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}


// MARK: - CreateGameViewProtocol realization
extension CreateGameViewController: CreateGameViewProtocol {
    
}
