//
//  ViewController.swift
//  Spy-game
//
//  Created by Сергей on 20.03.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    // UI elements
    let gameTitleLabel = UILabel(textLabel: "Шпион")
    let spyLogoImage = UIImageView(image: UIImage(named: "SpyLogoImage"))
    let rulesButton = UIButton(type: .system)
    let startGameButton = UIButton(title: "Создать игру", titleColor: .white, backgroundColor: .black, font: .systemFont(ofSize: 30), isShadow: false, cornerRadius: 20)
    let showRulesButton = UIButton(title: "Правила игры", titleColor: .black, backgroundColor: .white, font: .systemFont(ofSize: 30), isShadow: false, cornerRadius: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        addTitleLabel()
        addRulesButton()
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
            spyLogoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    private func addTitleLabel() {
        view.addSubview(gameTitleLabel)
        gameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        gameTitleLabel.textColor = .black
        gameTitleLabel.font = UIFont(name: "HelveticaNeue", size: 30)
        
        NSLayoutConstraint.activate([
            gameTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            gameTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func addRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.translatesAutoresizingMaskIntoConstraints = false
        rulesButton.setTitle("Поддержать автора", for: .normal)
        rulesButton.setTitleColor(.red, for: .normal)
        rulesButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 30)
        NSLayoutConstraint.activate([
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        rulesButton.addTarget(self, action: #selector(rulesButtonPressed), for: .touchUpInside)
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
    }
    
    // MARK: - UI actions
    @objc func rulesButtonPressed() {
        print("rulesButtonPressed")
    }
    
    @objc func startGameButtonPressed() {
        print("startGameButtonPressed")
    }
    
    
}

