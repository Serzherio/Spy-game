//
//  ViewController.swift
//  Spy-game
//
//  Created by Сергей on 20.03.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    // UI elements
    let spyLogoImage = UIImageView(image: UIImage(named: "SpyLogoImage"))
    let rulesButton = UIButton(type: .system)
    let startGameLabel = UILabel(textLabel: "Начать новую игру:")
    let startGameButton = UIButton(title: "Создать игру", titleColor: .black, backgroundColor: .white, font: .systemFont(ofSize: 30), isShadow: true, cornerRadius: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        addRulesButton()
        addStartGameButton()
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
    
    private func addRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.translatesAutoresizingMaskIntoConstraints = false
        rulesButton.setTitle("Правила игры", for: .normal)
        rulesButton.setTitleColor(.red, for: .normal)
        rulesButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 30)
        NSLayoutConstraint.activate([
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
//            rulesButton.widthAnchor.constraint(equalToConstant: 100),
            rulesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        rulesButton.addTarget(self, action: #selector(rulesButtonPressed), for: .touchUpInside)
    }
    
    @objc func rulesButtonPressed() {
        print("rulesButtonPressed")
    }
    
    private func addStartGameButton() {
        //let startGameButton = LabelPlusButtonView(label: startGameLabel, button: startGameButton)
        let stackView = UIStackView(arrangedSubviews: [startGameButton])
        stackView.axis = .vertical
        stackView.spacing = 0
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    
}

