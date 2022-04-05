//
//  CreateGameController.swift
//  Spy-game
//
//  Created by Сергей on 22.03.2022.
//

import UIKit

class CreateGameViewController: UIViewController {
    
    //UI elements
    var titleSettingLabel = UILabel(textLabel: "Настройки игры", font: .noteworthy50())
    let continueButton = UIButton(title: "Продолжить", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    let minusButtonForPlayersAmmount = UIButton(type: .system)
    let plusButtonForPlayersAmmount = UIButton(type: .system)
    let minusButtonForSpyAmmount = UIButton(type: .system)
    let plusButtonForSpyAmmount = UIButton(type: .system)
    let minusButtonForDuringTime = UIButton(type: .system)
    let plusButtonForDuringTime = UIButton(type: .system)
    let chooseLocationsButton = UIButton(type: .system)
    let rulesButton = UIButton(type: .system)
    
    // variables
    var presenter: CreateGamePresenterProtocol?

    // custom UI elements
    var choosePlayersAmountInGameView = ViewWithLabelAndButtons(headLabel: UILabel(textLabel: "Игроки:", font: .noteworthy24()),
                                                                descriptionLabel: UILabel(textLabel: "",
                                                                font: .noteworthy24()),
                                                                buttons: [])
    var chooseSpyAmountInGameView = ViewWithLabelAndButtons(headLabel: UILabel(textLabel: "Шпионы:", font: .noteworthy24()),
                                                                descriptionLabel: UILabel(textLabel: "",
                                                                font: .noteworthy24()),
                                                                buttons: [])
    var timeDuringInGameView = ViewWithLabelAndButtons(headLabel: UILabel(textLabel: "Время:", font: .noteworthy24()),
                                                                descriptionLabel: UILabel(textLabel: "",
                                                                font: .noteworthy24()),
                                                                buttons: [])
    var rolePlayView = ViewWithLabelAndButtons(headLabel: UILabel(textLabel: "Роли:", font: .noteworthy24()),
                                                                descriptionLabel: UILabel(textLabel: "",
                                                                font: .noteworthy24()),
                                                                buttons: [])
    var chooseLocationAmountInGameView = ViewWithLabelAndButtons(headLabel: UILabel(textLabel: "Локации:", font: .noteworthy24()),
                                                                descriptionLabel: UILabel(textLabel: "",
                                                                font: .noteworthy24()),
                                                                buttons: [])
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)

        designButtons()
        layoutDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    
    // MARK: - Layout View
    private func designButtons() {
        minusButtonForPlayersAmmount.setImage(UIImage(named: "MinusAction"), for: .normal)
        plusButtonForPlayersAmmount.setImage(UIImage(named: "PlusAction"), for: .normal)
        minusButtonForSpyAmmount.setImage(UIImage(named: "MinusAction"), for: .normal)
        plusButtonForSpyAmmount.setImage(UIImage(named: "PlusAction"), for: .normal)
        minusButtonForDuringTime.setImage(UIImage(named: "MinusAction"), for: .normal)
        plusButtonForDuringTime.setImage(UIImage(named: "PlusAction"), for: .normal)
        rulesButton.setImage(UIImage(named: "NoAction"), for: .normal)
        chooseLocationsButton.setImage(UIImage(named: "SearchAction"), for: .normal)
        minusButtonForPlayersAmmount.addTarget(self, action: #selector(minusButtonForPlayersAmmountTapped), for: .touchUpInside)
        plusButtonForPlayersAmmount.addTarget(self, action: #selector(plusButtonForPlayersAmmountTapped), for: .touchUpInside)
        minusButtonForSpyAmmount.addTarget(self, action: #selector(minusButtonForSpyAmmountTapped), for: .touchUpInside)
        plusButtonForSpyAmmount.addTarget(self, action: #selector(plusButtonForSpyAmmountTapped), for: .touchUpInside)
        minusButtonForDuringTime.addTarget(self, action: #selector(minusButtonForDuringTimeTapped), for: .touchUpInside)
        plusButtonForDuringTime.addTarget(self, action: #selector(plusButtonForDuringTimeTapped), for: .touchUpInside)
        rulesButton.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        chooseLocationsButton.addTarget(self, action: #selector(chooseLocationsButtonTapped), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    

    
    
    
    
    private func createCustomSettingView(headLabelText: String, descriptionLabelText: String, buttons: [UIButton]) -> UIView {
        let headLabel = UILabel(textLabel: headLabelText, font: .noteworthy24())
        let descriptionLabel = UILabel(textLabel: descriptionLabelText, font: .noteworthy24())
        let customView = ViewWithLabelAndButtons(headLabel: headLabel, descriptionLabel: descriptionLabel, buttons: buttons)
        return customView
    }
    
    private func layoutDesign() {
        guard let gameSet = presenter?.gameSettings else { return }
        
        choosePlayersAmountInGameView = ViewWithLabelAndButtons(headLabel: UILabel(textLabel: "Игроки:", font: .noteworthy24()),
                                                                descriptionLabel: UILabel(textLabel: String(gameSet.playerAmmount),
                                                                font: .noteworthy24()),
                                                                buttons: [minusButtonForPlayersAmmount, plusButtonForPlayersAmmount])
        chooseSpyAmountInGameView = ViewWithLabelAndButtons(headLabel: UILabel(textLabel: "Шпионы:", font: .noteworthy24()),
                                                            descriptionLabel: UILabel(textLabel: String(gameSet.spyAmmount),
                                                            font: .noteworthy24()),
                                                            buttons: [minusButtonForSpyAmmount, plusButtonForSpyAmmount])
        timeDuringInGameView = ViewWithLabelAndButtons(headLabel: UILabel(textLabel: "Время:", font: .noteworthy24()),
                                                       descriptionLabel: UILabel(textLabel: String(gameSet.timeDuring) + " мин",
                                                       font: .noteworthy24()),
                                                       buttons: [minusButtonForDuringTime, plusButtonForDuringTime])
        switch gameSet.roles {
        case true:
            rolePlayView = ViewWithLabelAndButtons(headLabel: UILabel(textLabel: "Роли:", font: .noteworthy24()),
                                                   descriptionLabel: UILabel(textLabel: "да", font: .noteworthy24()),
                                                   buttons: [rulesButton])
        case false:
            rolePlayView = ViewWithLabelAndButtons(headLabel: UILabel(textLabel: "Роли:", font: .noteworthy24()),
                                                   descriptionLabel: UILabel(textLabel: "нет", font: .noteworthy24()),
                                                   buttons: [rulesButton])
        }

        chooseLocationAmountInGameView = ViewWithLabelAndButtons(headLabel: UILabel(textLabel: "Локации:", font: .noteworthy24()),
                                                                 descriptionLabel: UILabel(textLabel: String(gameSet.selectedLocations.count), font: .noteworthy24()),
                                                                 buttons: [chooseLocationsButton])

        let stackView = UIStackView(arrangedSubviews: [ choosePlayersAmountInGameView,
                                                       chooseSpyAmountInGameView, timeDuringInGameView, rolePlayView, chooseLocationAmountInGameView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
    
        stackView.translatesAutoresizingMaskIntoConstraints = false
        titleSettingLabel.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.removeFromSuperview()
        titleSettingLabel.removeFromSuperview()
        titleSettingLabel.removeFromSuperview()
        
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
    
    private func updateView() {
        guard let gameSet = presenter?.gameSettings else { return }
        
        choosePlayersAmountInGameView.descriptionLabel.text =  String(gameSet.playerAmmount)
        chooseSpyAmountInGameView.descriptionLabel.text =  String(gameSet.spyAmmount)
        timeDuringInGameView.descriptionLabel.text =  String(gameSet.timeDuring) + " мин"
        switch gameSet.roles {
        case true:
            rolePlayView.descriptionLabel.text =  "да"
            rulesButton.setImage(UIImage(named: "YesAction"), for: .normal)
        case false:
            rolePlayView.descriptionLabel.text =  "нет"
            rulesButton.setImage(UIImage(named: "NoAction"), for: .normal)
        }
        chooseLocationAmountInGameView.descriptionLabel.text =  String(gameSet.selectedLocations.count)
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
    @objc private func rulesButtonTapped() {
        presenter?.rulesButtonTapped()
    }
    @objc private func chooseLocationsButtonTapped() {
        presenter?.chooseLocationsButtonTapped()
    }
    @objc private func continueButtonTapped() {
        presenter?.continueButtonTapped()
    }
    
    
    
}


// MARK: - CreateGameViewProtocol realization
extension CreateGameViewController: CreateGameViewProtocol {
    func updateUI() {
        updateView()
    }
    
}
