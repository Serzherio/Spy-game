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
    
    
    // Custom UI Elements
    lazy var choosePlayersAmountInGameView = createCustomSettingView(headLabelText: "", descriptionLabelText: "", buttons: [])
    
    // variables
    var presenter: CreateGamePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)

        designButtons()
        layoutDesign()
    }
    
    
    // MARK: - Layout View
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
        minusButtonForPlayersAmmount.addTarget(self, action: #selector(minusButtonForPlayersAmmountTapped), for: .touchUpInside)
        plusButtonForPlayersAmmount.addTarget(self, action: #selector(plusButtonForPlayersAmmountTapped), for: .touchUpInside)
        minusButtonForSpyAmmount.addTarget(self, action: #selector(minusButtonForSpyAmmountTapped), for: .touchUpInside)
        plusButtonForSpyAmmount.addTarget(self, action: #selector(plusButtonForSpyAmmountTapped), for: .touchUpInside)
        minusButtonForDuringTime.addTarget(self, action: #selector(minusButtonForDuringTimeTapped), for: .touchUpInside)
        plusButtonForDuringTime.addTarget(self, action: #selector(plusButtonForDuringTimeTapped), for: .touchUpInside)
        yesButton.addTarget(self, action: #selector(yesButtonTapped), for: .touchUpInside)
        chooseLocationsButton.addTarget(self, action: #selector(chooseLocationsButtonTapped), for: .touchUpInside)
    }
    
    private func designCustomView() {
        guard let gameSet = presenter?.gameSettings else { return }
        choosePlayersAmountInGameView = createCustomSettingView(headLabelText: "Игроки:",
                                                                    descriptionLabelText: String(gameSet.playerAmmount),
                                                                    buttons: [minusButtonForPlayersAmmount, plusButtonForPlayersAmmount])
    }
    
    
    
    private func createCustomSettingView(headLabelText: String, descriptionLabelText: String, buttons: [UIButton]) -> UIView {
        let headLabel = UILabel(textLabel: headLabelText, font: .noteworthy24()!)
        let descriptionLabel = UILabel(textLabel: descriptionLabelText, font: .noteworthy24()!)
        let customView = ViewWithLabelAndButtons(headLabel: headLabel, descriptionLabel: descriptionLabel, buttons: buttons)
        return customView
    }
    
    private func layoutDesign() {
        guard let gameSet = presenter?.gameSettings else { return }
        
        //let
        choosePlayersAmountInGameView = createCustomSettingView(headLabelText: "Игроки:",
                                                                    descriptionLabelText: String(gameSet.playerAmmount),
                                                                    buttons: [minusButtonForPlayersAmmount, plusButtonForPlayersAmmount])
        let chooseSpyAmountInGameView = createCustomSettingView(headLabelText: "Шпионы:",
                                                                descriptionLabelText: String(gameSet.spyAmmount),
                                                                buttons: [minusButtonForSpyAmmount, plusButtonForSpyAmmount])
        let timeDuringInGameView = createCustomSettingView(headLabelText: "Время:",
                                                           descriptionLabelText: String(gameSet.timeDuring) + " мин",
                                                           buttons: [minusButtonForDuringTime, plusButtonForDuringTime])
        var rolePlayView = createCustomSettingView(headLabelText: "Роли:", descriptionLabelText: "да", buttons: [yesButton])
        switch gameSet.roles {
        case true:
            rolePlayView = createCustomSettingView(headLabelText: "Роли:", descriptionLabelText: "да", buttons: [yesButton])
        case false:
            rolePlayView = createCustomSettingView(headLabelText: "Роли:", descriptionLabelText: "нет", buttons: [noButton])
        }
       
        let chooseLocationAmountInGameView = createCustomSettingView(headLabelText: "Локации:",
                                                                     descriptionLabelText: String(gameSet.locations.count),
                                                                     buttons: [chooseLocationsButton])
        
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
    
    
    //MARK: - UIActions
    @objc private func minusButtonForPlayersAmmountTapped() {
        presenter?.minusButtonForPlayersAmmountTapped()
    }
    @objc private func plusButtonForPlayersAmmountTapped() {
        presenter?.plusButtonForPlayersAmmountTapped()
    }
    @objc private func minusButtonForSpyAmmountTapped() {
        presenter?.minusButtonForSpyAmmountTapped()
    }
    @objc private func plusButtonForSpyAmmountTapped() {
        presenter?.plusButtonForSpyAmmountTapped()
    }
    @objc private func minusButtonForDuringTimeTapped() {
        presenter?.minusButtonForDuringTimeTapped()
    }
    @objc private func plusButtonForDuringTimeTapped() {
        presenter?.plusButtonForDuringTimeTapped()
    }
    @objc private func yesButtonTapped() {
        presenter?.yesButtonTapped()
    }
    @objc private func chooseLocationsButtonTapped() {
        presenter?.chooseLocationsButtonTapped()
    }
    
    
    
}


// MARK: - CreateGameViewProtocol realization
extension CreateGameViewController: CreateGameViewProtocol {
    func updateUI() {
        designCustomView()
    }
    
}
