//
//  DonateViewController.swift
//  Spy-game
//
//  Created by Сергей on 13.04.2022.
//

import Foundation

class DonateViewController: UIViewController {
    
    let descriptionTitle = UILabel(textLabel: "Для поддержки автора напишите свои пожелания под игрой в магазине и оцените игру. Благодаря вашим словам, игра получит развитие и поддержку!", font: .noteworthy30())
    let stopGameButton = UIButton(title: "Вернуться", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    
    var presenter: DonatePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 213/255, green: 46/255, blue: 46/255, alpha: 1)
        descriptionTitle.numberOfLines = 0
        descriptionTitle.textAlignment = .center
        stopGameButton.addTarget(self, action: #selector(stopGameButtonPressed), for: .touchUpInside)
        layout()
    }
    @objc private func stopGameButtonPressed() {
        presenter?.closeVC()
    }
    
    
    private func layout() {
        stopGameButton.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stopGameButton)
        view.addSubview(descriptionTitle)
        NSLayoutConstraint.activate([
            descriptionTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            descriptionTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.95),
            stopGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stopGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stopGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            stopGameButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    
    
}

extension DonateViewController: DonateViewProtocol {
    
}

