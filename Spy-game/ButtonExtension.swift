//
//  ButtonExtension.swift
//  Spy-game
//
//  Created by Сергей on 20.03.2022.
//
import UIKit

/*
 custom init with  title,
                    titleColor,
                    backgroundColor,
                    optional font,
                    bool shadow,
                    cornerRadius
 custom UIButton is needed for custom view on signInVC block
 if button's shadow is needed, init with TRUE isShadow parameter (const)
*/
extension UIButton {
    
    convenience init(title: String,
                     titleColor:UIColor,
                     backgroundColor: UIColor,
                     font: UIFont?,
                     isShadow: Bool,
                     cornerRadius: CGFloat) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 5
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 10, height: 10)
        }
    }
}
