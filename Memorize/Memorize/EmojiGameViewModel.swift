//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Eugene Dudkin on 05.09.2023.
//

import SwiftUI

enum EmojiSetType: Int {
  case vehiclesEmojis = 1
  case sportsEmojis = 2
  case countriesEmojis = 3
}

final class EmojiGameViewModel: ObservableObject {
  var gameModel = EmojiGameModel() {
    didSet {
      objectWillChange.send()
    }
  }
  var selectedIndex = -1

  func startEmojiGame(contentType: EmojiSetType, repeating: Int, contentIndex: Int) {
    selectedIndex = contentIndex
    
    let emojiesSet: EmojiesSet
    
    switch contentType {
    case .vehiclesEmojis:
      emojiesSet = .vehiclesEmojis
    case .sportsEmojis:
      emojiesSet = .sportsEmojis
    case .countriesEmojis:
      emojiesSet = .countriesEmojis
    }
    
    gameModel.reloadCards(with: emojiesSet, repeating: repeating)
  }
}
