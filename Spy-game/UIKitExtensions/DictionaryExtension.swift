//
//  DictionaryExtension.swift
//  Spy-game
//
//  Created by Сергей on 03.04.2022.
//

import Foundation

extension Dictionary {
  mutating func merge(other: Dictionary) {
    for (key,value) in other {
      self.updateValue(value, forKey:key)
    }
  }
}
