//
//  StopTimerViewController.swift
//  Spy-game
//
//  Created by Сергей on 07.04.2022.
//

import UIKit

class StopTimerViewController: UIViewController {
    
    // UIElements
    let headTitle = UILabel(textLabel: "Время устроить голосование!", font: .noteworthy50())
    let subHeadTitle = UILabel(textLabel: "Количество шпионов, которое вам необходимо вычислить:", font: .noteworthy24())
    let spyAmmountTitle = UILabel(textLabel: "", font: .noteworthy50())
    let descriptionTitle = UILabel(textLabel: "Если голосование завершено, нажмите кнопку, чтобы узнать результат", font: .noteworthy24())
    let stopGameButton = UIButton(title: "Кто был шпионом?", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    
    
    var presenter: StopTimerPresenterProtocol?
    
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
        spyAmmountTitle.numberOfLines = 0
        spyAmmountTitle.textAlignment = .center
        descriptionTitle.numberOfLines = 0
        descriptionTitle.textAlignment = .center
        stopGameButton.addTarget(self, action: #selector(stopGameButtonTapped), for: .touchUpInside)
    }
    
    private func layoutDesign() {
        headTitle.translatesAutoresizingMaskIntoConstraints = false
        subHeadTitle.translatesAutoresizingMaskIntoConstraints = false
        spyAmmountTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        stopGameButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headTitle)
        view.addSubview(subHeadTitle)
        view.addSubview(spyAmmountTitle)
        view.addSubview(descriptionTitle)
        view.addSubview(stopGameButton)

        NSLayoutConstraint.activate([
            headTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            headTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.8),
            subHeadTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            subHeadTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subHeadTitle.topAnchor.constraint(equalTo: headTitle.bottomAnchor, constant: 20),
            spyAmmountTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spyAmmountTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
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
        presenter?.closeVoting()
    }
    
    
    
    
}

extension StopTimerViewController: StopTimerViewProtocol {
    func lol(spyAmmount: Int) {
        spyAmmountTitle.text = String(spyAmmount)
    }
    
    
}
