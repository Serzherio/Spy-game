//
//  LabelExtension.swift
//  Spy-game
//
//  Created by Сергей on 20.03.2022.
//

import UIKit

// custom init with text in label
extension UILabel {
    convenience init(textLabel: String, font: UIFont) {
        self.init()
        self.text = textLabel
        self.font = font
    }
}
