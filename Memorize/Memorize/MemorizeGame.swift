//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Eugene Dudkin on 05.09.2023.
//

import Foundation

struct MemoryGame<CardContent> {
  struct Card {
    var isFacedUp: Bool
    var isMatched: Bool
    var content: CardContent
  }
  
  var cards = Array<Card>()
  
  func choose(card: Card) {
    
  }
}
