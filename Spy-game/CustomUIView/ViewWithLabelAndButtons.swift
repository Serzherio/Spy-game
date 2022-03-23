//
//  ViewWithLabelAndButtons.swift
//  Spy-game
//
//  Created by Сергей on 22.03.2022.
//

import UIKit

class ViewWithLabelAndButtons: UIView {
    
    init(headLabel: UILabel, descriptionLabel: UILabel, buttons: [UIButton]){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        for button in buttons {
            button.translatesAutoresizingMaskIntoConstraints = false
        }
        let buttonsStackView = UIStackView(arrangedSubviews: buttons)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 10

        self.addSubview(headLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(buttonsStackView)
        
        headLabel.font = .noteworthy24()
        descriptionLabel.font = .noteworthy24()
        
        NSLayoutConstraint.activate([
            headLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            headLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            buttonsStackView.topAnchor.constraint(equalTo: self.topAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.heightAnchor.constraint(equalToConstant: 80),
        ])
        
        self.backgroundColor = UIColor(red: 214/255, green: 148/255, blue: 148/255, alpha: 1)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.layer.cornerRadius = 40
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
