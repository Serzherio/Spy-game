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
    let continueButton = UIButton(title: "Продолжить", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    let minusButtonForPlayersAmmount = UIButton(type: .system)
    let plusButtonForPlayersAmmount = UIButton(type: .system)
    let minusButtonForSpyAmmount = UIButton(type: .system)
    let plusButtonForSpyAmmount = UIButton(type: .system)
    let minusButtonForDuringTime = UIButton(type: .system)
    let plusButtonForDuringTime = UIButton(type: .system)
    let chooseLocationsButton = UIButton(type: .system)
    let noButton = UIButton(type: .system)
    let yesButton = UIButton(type: .system)
    
    // variables
    var presenter: CreateGamePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)
//        self.view.backgroundColor = .systemRed

        designButtons()
        layoutDesign()
    }
    
    private func designButtons() {
        minusButtonForPlayersAmmount.setImage(UIImage(named: "MinusAction"), for: .normal)
        plusButtonForPlayersAmmount.setImage(UIImage(named: "PlusAction"), for: .normal)
        minusButtonForSpyAmmount.setImage(UIImage(named: "MinusAction"), for: .normal)
        plusButtonForSpyAmmount.setImage(UIImage(named: "PlusAction"), for: .normal)
        minusButtonForDuringTime.setImage(UIImage(named: "MinusAction"), for: .normal)
        plusButtonForDuringTime.setImage(UIImage(named: "PlusAction"), for: .normal)
        yesButton.setImage(UIImage(named: "YesAction"), for: .normal)
        noButton.setImage(UIImage(named: "NoAction"), for: .normal)
        chooseLocationsButton.setImage(UIImage(named: "SearchAction"), for: .normal)
    }
    
    private func createCustomSettingView(headLabelText: String, descriptionLabelText: String, buttons: [UIButton]) -> UIView {
        let headLabel = UILabel(textLabel: headLabelText, font: .noteworthy24()!)
        let descriptionLabel = UILabel(textLabel: descriptionLabelText, font: .noteworthy24()!)
        let customView = ViewWithLabelAndButtons(headLabel: headLabel, descriptionLabel: descriptionLabel, buttons: buttons)
        return customView
    }
    
    
    private func layoutDesign() {
        
        let choosePlayersAmountInGameView = createCustomSettingView(headLabelText: "Игроки:", descriptionLabelText: "5", buttons: [minusButtonForPlayersAmmount, plusButtonForPlayersAmmount])
        let chooseSpyAmountInGameView = createCustomSettingView(headLabelText: "Шпионы:", descriptionLabelText: "1", buttons: [minusButtonForSpyAmmount, plusButtonForSpyAmmount])
        let timeDuringInGameView = createCustomSettingView(headLabelText: "Время:", descriptionLabelText: "5 мин", buttons: [minusButtonForDuringTime, plusButtonForDuringTime])
        let rolePlayView = createCustomSettingView(headLabelText: "Роли:", descriptionLabelText: "да", buttons: [yesButton])
        let chooseLocationAmountInGameView = createCustomSettingView(headLabelText: "Локации:", descriptionLabelText: "3", buttons: [chooseLocationsButton])
        
        let stackView = UIStackView(arrangedSubviews: [choosePlayersAmountInGameView, chooseSpyAmountInGameView, timeDuringInGameView, rolePlayView, chooseLocationAmountInGameView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
    
        stackView.translatesAutoresizingMaskIntoConstraints = false
        titleSettingLabel.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        self.view.addSubview(titleSettingLabel)
        self.view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            titleSettingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            titleSettingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 80),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: titleSettingLabel.bottomAnchor, constant: 30),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}


// MARK: - CreateGameViewProtocol realization
extension CreateGameViewController: CreateGameViewProtocol {
    
}
