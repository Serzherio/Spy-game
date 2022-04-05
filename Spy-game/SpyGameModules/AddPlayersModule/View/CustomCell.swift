//
//  CustomCell.swift
//  Spy-game
//
//  Created by Сергей on 30.03.2022.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let view = UIView()
    let number = UILabel()
    let name = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        number.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.masksToBounds = true
        view.clipsToBounds = false
        view.backgroundColor = UIColor(red: 214/255, green: 148/255, blue: 148/255, alpha: 1)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.cornerRadius = 20
        number.font = .noteworthy30()
        name.font = .noteworthy30()
        
        addSubview(view)
        addSubview(number)
        addSubview(name)
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
        
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            view.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            number.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            number.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            name.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

     

}


