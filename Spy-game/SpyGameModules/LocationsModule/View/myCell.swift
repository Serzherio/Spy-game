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
        image.contentMode = .scaleAspectFit
        title?.translatesAutoresizingMaskIntoConstraints = false
        image?.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(title)
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -10),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
