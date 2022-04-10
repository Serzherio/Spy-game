//
//  ViewController.swift
//  Spy-game
//
//  Created by Сергей on 20.03.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    // UI elements
    let gameTitleLabel = UILabel(textLabel: "Шпион", font: .noteworthy50())
    let spyLogoImage = UIImageView(image: UIImage(named: "SpyLogoImage"))
    let donateButton = UIButton(type: .system)
    let startGameButton = UIButton(title: "Создать игру", titleColor: .white, backgroundColor: .black, font: .noteworthy30(), isShadow: false, cornerRadius: 40)
    let showRulesButton = UIButton(title: "Правила игры", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: false, cornerRadius: 40)
    
    // variables
    var presenter: StartScreenPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        addTitleLabel()
        addDonateAuthorButton()
        addButtonsOnScreen()
    }
  

    
    //MARK: - UI setup functions
    private func setupBackground() {
        view.backgroundColor = UIColor(red: 213/255, green: 46/255, blue: 46/255, alpha: 1)
        view.addSubview(spyLogoImage)
        spyLogoImage.contentMode = .scaleAspectFit
        spyLogoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spyLogoImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            spyLogoImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            spyLogoImage.heightAnchor.constraint(equalToConstant: self.view.bounds.width),
            spyLogoImage.widthAnchor.constraint(equalToConstant: self.view.bounds.width),
            spyLogoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: .none, action: .none)
    }
    
    private func addTitleLabel() {
        view.addSubview(gameTitleLabel)
        gameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        gameTitleLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            gameTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            gameTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func addDonateAuthorButton() {
        view.addSubview(donateButton)
        donateButton.translatesAutoresizingMaskIntoConstraints = false
        donateButton.setTitle("Поддержать автора", for: .normal)
        donateButton.setTitleColor(.red, for: .normal)
        donateButton.titleLabel?.font = .noteworthy24()
        NSLayoutConstraint.activate([
            donateButton.heightAnchor.constraint(equalToConstant: 50),
            donateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            donateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        donateButton.addTarget(self, action: #selector(rulesButtonPressed), for: .touchUpInside)
    }
    
    
    
    private func addButtonsOnScreen() {
        let stackView = UIStackView(arrangedSubviews: [startGameButton, showRulesButton])
        stackView.axis = .vertical
        stackView.spacing = 30
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: gameTitleLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 200),
        ])
        startGameButton.addTarget(self, action: #selector(startGameButtonPressed), for: .touchUpInside)
        showRulesButton.addTarget(self, action: #selector(showRulesButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - UI actions
    @objc func rulesButtonPressed() {
        presenter.pressDonateAuthor()
    }
    
    @objc func startGameButtonPressed() {
        presenter.pressStartGameButton()
    }
    
    @objc func showRulesButtonPressed() {
        presenter.pressShowRulesButton()
    }
    
    
}

// MARK: - StartScreenViewProtocol realization
extension StartViewController: StartScreenViewProtocol {
    func testFunc() {
    }
}

