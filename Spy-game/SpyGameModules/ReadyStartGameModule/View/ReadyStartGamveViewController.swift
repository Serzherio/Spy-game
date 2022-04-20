//
//  ReadyStartGamveViewController.swift
//  Spy-game
//
//  Created by Сергей on 10.04.2022.
//

import UIKit

class ReadyStartGameViewController: UIViewController {
    
    let headTitle = UILabel(textLabel: "Начинаем!", font: .noteworthy50())
    let subHeadTitle = UILabel(textLabel: "Присаживайтесь поудобнее, расположите экран так, чтобы все видели таймер времени", font: .noteworthy30())
    let descriptionTitle = UILabel(textLabel: "Задавайте друг другу вопросы, не позволив шпиону угадать локацию", font: .noteworthy24())
    let stopGameButton = UIButton(title: "Поехали!", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    
    var presenter: ReadyStartPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundImage")!)
        setupUIElements()
        layoutDesign()
    }
    
    private func setupUIElements() {
        headTitle.numberOfLines = 0
        headTitle.textAlignment = .center
        subHeadTitle.numberOfLines = 0
        subHeadTitle.textAlignment = .center
        descriptionTitle.numberOfLines = 0
        descriptionTitle.textAlignment = .center
        stopGameButton.addTarget(self, action: #selector(stopGameButtonTapped), for: .touchUpInside)
    }
    
    private func layoutDesign() {
        headTitle.translatesAutoresizingMaskIntoConstraints = false
        subHeadTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        stopGameButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headTitle)
        view.addSubview(subHeadTitle)
        view.addSubview(descriptionTitle)
        view.addSubview(stopGameButton)

        NSLayoutConstraint.activate([
            headTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            headTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.8),
            subHeadTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            subHeadTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subHeadTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            descriptionTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTitle.bottomAnchor.constraint(equalTo: stopGameButton.topAnchor, constant: -50),
            descriptionTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            stopGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stopGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stopGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            stopGameButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    @objc private func stopGameButtonTapped() {
        presenter?.startGame()
    }
    
}

extension ReadyStartGameViewController: ReadyStartViewProtocol {
    
}
