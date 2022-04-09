//
//  EndGameViewController.swift
//  Spy-game
//
//  Created by Сергей on 08.04.2022.
//

import UIKit

class EndGameViewController: UIViewController {
    
    // UIElements
    let headTitle = UILabel(textLabel: "Выбор сделан!", font: .noteworthy50())
    let subHeadTitle = UILabel(textLabel: "Шпионом оказался...", font: .noteworthy24())
    let spyTitle = UILabel(textLabel: "", font: .noteworthy50())
    let descriptionTitle = UILabel(textLabel: "Если игра зашла, закиньте авторам на пиво:)", font: .noteworthy24())
    let stopGameButton = UIButton(title: "Завершить", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    
    var presenter: EndGamePresenterProtocol?
    
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
        spyTitle.numberOfLines = 0
        spyTitle.textAlignment = .center
        spyTitle.adjustsFontSizeToFitWidth = true
        descriptionTitle.numberOfLines = 0
        descriptionTitle.textAlignment = .center
        stopGameButton.addTarget(self, action: #selector(stopGameButtonTapped), for: .touchUpInside)
    }
    
    private func layoutDesign() {
        headTitle.translatesAutoresizingMaskIntoConstraints = false
        subHeadTitle.translatesAutoresizingMaskIntoConstraints = false
        spyTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        stopGameButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headTitle)
        view.addSubview(subHeadTitle)
        view.addSubview(spyTitle)
        view.addSubview(descriptionTitle)
        view.addSubview(stopGameButton)

        NSLayoutConstraint.activate([
            headTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            headTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.8),
            subHeadTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            subHeadTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subHeadTitle.topAnchor.constraint(equalTo: headTitle.bottomAnchor, constant: 20),
            spyTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spyTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spyTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            spyTitle.bottomAnchor.constraint(equalTo: descriptionTitle.topAnchor, constant: -30),
            descriptionTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTitle.bottomAnchor.constraint(equalTo: stopGameButton.topAnchor, constant: -30),
            descriptionTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            stopGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stopGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stopGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            stopGameButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc private func stopGameButtonTapped() {
        presenter?.endGame()
    }
    
}

extension EndGameViewController: EndGameViewProtocol {
    func showSpies(spy: [String]) {
        spyTitle.alpha = 0
        for i in 0...spy.count - 1 {
            spyTitle.text! += spy[i]
            spyTitle.text! += " "
        }
        
        if spy.count > 1 {
            subHeadTitle.text! = "Шпионами оказались..."
        }
        
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseInOut) {
            self.spyTitle.alpha = 1
        }
    }
    
    
}
