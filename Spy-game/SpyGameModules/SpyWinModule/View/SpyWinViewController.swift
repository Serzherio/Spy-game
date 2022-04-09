//
//  SpyWinViewController.swift
//  Spy-game
//
//  Created by Сергей on 06.04.2022.
//

import UIKit

class SpyWinViewController: UIViewController {
    let headTitle = UILabel(textLabel: "Время вышло!", font: .noteworthy50())
    let subTitle = UILabel(textLabel: "Шпион победил, им оказался...", font: .noteworthy24())
    let logo = UIImageView(image: UIImage(named: "Bomb"))
    let spiesLabel = UILabel(textLabel: "", font: .noteworthy50())
    let endGameButton = UIButton(title: "Это было жестко!", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    
    var presenter: SpyWinPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)
        setupUIElements()
        layoutDesign()
    }
    
    private func setupUIElements() {
        headTitle.numberOfLines = 0
        headTitle.textAlignment = .center
        subTitle.numberOfLines = 0
        subTitle.textAlignment = .center
        spiesLabel.numberOfLines = 0
        spiesLabel.textAlignment = .center
        spiesLabel.adjustsFontSizeToFitWidth = true
        logo.contentMode = .scaleAspectFit
        endGameButton.addTarget(self, action: #selector(endGameButtonPressed), for: .touchUpInside)
    }

    private func layoutDesign() {
        headTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        spiesLabel.translatesAutoresizingMaskIntoConstraints = false
        logo.translatesAutoresizingMaskIntoConstraints = false
        endGameButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headTitle)
        view.addSubview(subTitle)
        view.addSubview(spiesLabel)
        view.addSubview(logo)
        view.addSubview(endGameButton)
        
        NSLayoutConstraint.activate([
            headTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            headTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.8),
            subTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            subTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subTitle.topAnchor.constraint(equalTo: headTitle.bottomAnchor, constant: 20),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 150),
            logo.heightAnchor.constraint(equalToConstant: 150),
            spiesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spiesLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            spiesLabel.bottomAnchor.constraint(equalTo: endGameButton.topAnchor, constant: -20),
            spiesLabel.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            endGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            endGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            endGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            endGameButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    
    @objc private func endGameButtonPressed() {
        presenter?.endGame()
    }
    
}

extension SpyWinViewController: SpyWinViewProcotol {
    
    func showSpyPlayersInGame(spy: [String]) {
        spiesLabel.alpha = 0
        for i in 0...spy.count - 1 {
            spiesLabel.text! += spy[i]
            spiesLabel.text! += " "
        }
        
        if spy.count > 1 {
            subTitle.text! = "Шпионы победили, ими оказались..."
        }
        
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseInOut) {
            self.spiesLabel.alpha = 1
        }
    }
    
  
}
