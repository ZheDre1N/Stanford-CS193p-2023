//
//  EmojiesSet.swift
//  Memorize
//
//  Created by Eugene Dudkin on 05.09.2023.
//

import SwiftUI

struct EmojiesSet {
  let color: Color
  let emojis: Array<Character>
  
  private init(color: Color, emojis: Array<Character>) {
    self.color = color
    self.emojis = emojis
  }
}

// MARK: - EmojiesSet

extension EmojiesSet {
  static let empty = Self(color: .black, emojis: Array<Character>())
  
  static let vehiclesEmojis = Self(
    color: .red,
    emojis: ["✈️", "🚗", "🚀", "🚘", "🚙", "🚎", "🚛", "🚕", "🚁", "🏎️", "🚒"]
  )
  
  static let sportsEmojis = Self(
    color: .orange,
    emojis: ["⚽️", "🏀", "🏈", "⚾️", "🏓", "🏒", "🚴‍♀️", "🥊", "🥋", "🏄‍♂️"]
  )
  
  static let countriesEmojis = Self(
    color: .blue,
    emojis: ["🇬🇧", "🇺🇸", "🇫🇲", "🇩🇰", "🇦🇪", "🇵🇭", "🇵🇰", "🇷🇸", "🇫🇮", "🇾🇪"]
  )
}
