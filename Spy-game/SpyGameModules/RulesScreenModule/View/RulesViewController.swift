//
//  RulesViewController.swift
//  Spy-game
//
//  Created by Сергей on 22.03.2022.
//

import UIKit

class RulesViewConrtoller: UIViewController {
    
    let rulesTitle = UILabel(textLabel: "Правила игры", font: .noteworthy50())
    let textView = UITextView()
    let closeRulesButton = UIButton(title: "Я все знаю", titleColor: .black, backgroundColor: .white, font: .noteworthy30(), isShadow: true, cornerRadius: 40)
    
    var presenter: RulesPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 213/255, green: 46/255, blue: 46/255, alpha: 1)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: .none, action: .none)
        setupUIElements()
        layoutDesign()
        createRulesText()
    }
    
    private func setupUIElements() {
        rulesTitle.numberOfLines = 0
        rulesTitle.textAlignment = .center
        textView.backgroundColor = .clear
        textView.font = .noteworthy24()
        textView.isScrollEnabled = true
        textView.isEditable = false
        
        closeRulesButton.addTarget(self, action: #selector(closeRulesButtonTapped), for: .touchUpInside)
    }
    
    private func createRulesText() {
        let text = RulesText()
        var concateText = NSMutableAttributedString()
        let headerAttributes: [NSAttributedString.Key: Any] = [ .font: UIFont.noteworthy30(), .foregroundColor: UIColor.white]
        let usualAttributes: [NSAttributedString.Key: Any] = [ .font: UIFont.noteworthy20(), .foregroundColor: UIColor.black]
        let usualAttributes24: [NSAttributedString.Key: Any] = [ .font: UIFont.noteworthy24(), .foregroundColor: UIColor.black]
        let goalAttr = NSAttributedString(string: text.goal, attributes: headerAttributes)
        concateText.append(goalAttr)
        let goalTextAttr = NSAttributedString(string: text.goalText, attributes: usualAttributes)
        concateText.append(goalTextAttr)
        let review = NSAttributedString(string: text.review, attributes: headerAttributes)
        concateText.append(review)
        let reviewText = NSAttributedString(string: text.reviewText, attributes: usualAttributes)
        concateText.append(reviewText)
        let race = NSAttributedString(string: text.race, attributes: headerAttributes)
        concateText.append(race)
        let raceText = NSAttributedString(string: text.raceText, attributes: usualAttributes)
        concateText.append(raceText)
        let order = NSAttributedString(string: text.order, attributes: headerAttributes)
        concateText.append(order)
        let orderText = NSAttributedString(string: text.orderText, attributes: usualAttributes)
        concateText.append(orderText)
        let short = NSAttributedString(string: text.short, attributes: headerAttributes)
        concateText.append(short)
        let shortText = NSAttributedString(string: text.shortText, attributes: usualAttributes24)
        concateText.append(shortText)
        
        
        textView.attributedText = concateText
    }
    
    private func layoutDesign() {
        rulesTitle.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        closeRulesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rulesTitle)
        view.addSubview(textView)
        view.addSubview(closeRulesButton)
        NSLayoutConstraint.activate([
            rulesTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulesTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            rulesTitle.widthAnchor.constraint(equalToConstant: view.layer.frame.width * 0.8),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.topAnchor.constraint(equalTo: rulesTitle.bottomAnchor, constant: 20),
            textView.bottomAnchor.constraint(equalTo: closeRulesButton.topAnchor, constant: -20),
            
            closeRulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            closeRulesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeRulesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            closeRulesButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc private func closeRulesButtonTapped() {
        presenter?.closeVC()
    }
    
}

extension RulesViewConrtoller: RulesViewProtocol {
    
}


