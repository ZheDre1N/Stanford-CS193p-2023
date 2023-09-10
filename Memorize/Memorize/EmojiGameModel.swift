//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Eugene Dudkin on 05.09.2023.
//

import SwiftUI

struct EmojiGameModel {
  struct Card {
    var isFacedUp: Bool
    var isMatched: Bool
    let content: Character
  }

  var cards = Array<Card>()
  var currentColor: Color = .black

  mutating func reloadCards(with content: EmojiesSet, repeating: Int) {
    var cards = Array<Card>()
    currentColor = content.color

    for _ in 0..<repeating {
      cards.append(contentsOf: content.emojis.map { Card(isFacedUp: false, isMatched: false, content: $0) })
    }
    
    self.cards = cards
  }

  mutating func shuffle() {
    cards.shuffle()
  }
}
