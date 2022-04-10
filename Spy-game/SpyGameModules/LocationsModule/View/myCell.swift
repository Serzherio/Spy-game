//
//  myCell.swift
//  Spy-game
//
//  Created by Сергей on 29.03.2022.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    var image: UIImageView!
    var title: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        createAndLayout(frame: frame)
    }
    private func createAndLayout(frame: CGRect) {
        self.title = UILabel(frame: frame)
        self.image = UIImageView(frame: frame)
        title.font = .noteworthy24()
        title.adjustsFontSizeToFitWidth = true
        title.textAlignment = .center
        image.contentMode = .scaleAspectFit
        title?.translatesAutoresizingMaskIntoConstraints = false
        image?.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.clipsToBounds = false
        
        contentView.addSubview(title)
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -10),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            title.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
