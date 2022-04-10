//
//  AddPlayersViewControllerExtension.swift
//  Spy-game
//
//  Created by Сергей on 10.04.2022.
//

import UIKit

extension AddPlayersViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "Введите имена игроков, имена не должны совпадать"
        let attrs = [NSAttributedString.Key.font: UIFont.noteworthy30(),
                     NSAttributedString.Key.foregroundColor: UIColor.black,
                    ]
        let textColor = UIColor.black
        return NSAttributedString(string: str, attributes: attrs)
    }
    func imageTintColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
        .black
    }
    func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        let str = "Количество игроков должно совпадать со значением из настроек игры!"
        let attrs = [NSAttributedString.Key.font: UIFont.noteworthy24(), NSAttributedString.Key.foregroundColor: UIColor.black]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    
}
