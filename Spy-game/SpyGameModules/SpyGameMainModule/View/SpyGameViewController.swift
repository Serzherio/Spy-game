//
//  SpyGameViewController.swift
//  Spy-game
//
//  Created by Сергей on 03.04.2022.
//

import UIKit

class SpyGameViewController: UIViewController {
    // UI elements
    var playerTitle = UILabel(textLabel: "", font: .noteworthy30())
    var playerSubtitle = UILabel(textLabel: "", font: .noteworthy30())
    let playerName = UILabel(textLabel: "", font: .noteworthy50())
    
    let nextPlayerButton = UIButton(title: "Я готов!", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    var logo = UIImageView(image: UIImage(named: "SpyLogoImage"))
    
    var presenter: SpyGamePresenterProtocol?
    let textPreset = Text()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)
        setupUIElements()
        layoutDesign()
    }
    
    private func setupUIElements() {
        playerTitle.text = textPreset.playerTitle
        playerTitle.numberOfLines = 0
        playerTitle.textAlignment = .center
        playerSubtitle.text = textPreset.playerSubtitle
        playerSubtitle.numberOfLines = 0
        playerSubtitle.textAlignment = .center
        playerName.numberOfLines = 0
        playerName.textAlignment = .center
        logo.contentMode = .scaleAspectFit
        nextPlayerButton.addTarget(self, action: #selector(nextPlayerButtonTapped), for: .touchUpInside)
    }
    private func layoutDesign() {
        playerTitle.translatesAutoresizingMaskIntoConstraints = false
        playerSubtitle.translatesAutoresizingMaskIntoConstraints = false
        playerName.translatesAutoresizingMaskIntoConstraints = false
        nextPlayerButton.translatesAutoresizingMaskIntoConstraints = false
        logo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playerTitle)
        view.addSubview(playerName)
        view.addSubview(playerSubtitle)
        view.addSubview(nextPlayerButton)
        view.addSubview(logo)
        constraitsForPrepareToShow()
    }
    private func constraitsForPrepareToShow() {
        NSLayoutConstraint.activate([
            playerTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playerTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            playerTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.8),
            playerName.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            playerName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playerName.topAnchor.constraint(equalTo: playerTitle.bottomAnchor, constant: 30),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 150),
            logo.heightAnchor.constraint(equalToConstant: 150),
            playerSubtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playerSubtitle.bottomAnchor.constraint(equalTo: nextPlayerButton.topAnchor, constant: -30),
            playerSubtitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.8),
            nextPlayerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextPlayerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextPlayerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            nextPlayerButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc private func nextPlayerButtonTapped() {
        presenter?.showNextPlayer()
    }
}

extension SpyGameViewController: SpyGameViewProtocol {

    func prepareToShowNextPlayer(player: String) {
        playerTitle.text = textPreset.playerTitle
        playerName.text = player
        playerSubtitle.text = textPreset.playerSubtitle
        logo.image = UIImage(named: "SearchAction")

    }
    
    
    func showNextPlayerOnScreen(location: String, isRolePlay: Bool, player: Dictionary<String, Bool>.Element) {
        if player.value == true { // if hi is a spy
            playerTitle.text = player.key
            playerName.text  = "Вы - ШПИОН"
            playerName.font = .noteworthy50()
            logo.image = UIImage(named: "SpyHead")
            playerSubtitle.text = "Удачной диверсии, мистер"
        } else {
            if isRolePlay {
                playerTitle.text = player.key
                playerName.text  = "Локация: \(location)"
                playerName.font = .noteworthy50()
                logo.image = UIImage(named: "SearchAction")
                playerSubtitle.text = "Ваша роль - рыбак!"
            } else {
                playerTitle.text = player.key
                playerName.text  = "Локация: \(location)"
                playerName.font = .noteworthy50()
                logo.image = UIImage(named: "SearchAction")
                playerSubtitle.text = "Удачной игры, \(player.key)!"
            }
            
        }
        

    }

    
    func updateUI() {
        
    }
}
