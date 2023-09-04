//
//  ContentView.swift
//  Memorize
//
//  Created by Eugene Dudkin on 02.09.2023.
//

import SwiftUI

struct ContentView: View {
  @State var currentEmojisSet = EmojiesSet.empty

  var body: some View {
    VStack {
      Text("Memorize!")
        .font(.largeTitle)
      ScrollView {
        cards
      }
      buttons
    }
    .padding()
  }
  
  var cards: some View {
    LazyVGrid(columns: gridItems(for: currentEmojisSet.emojis.count))  {
      ForEach(currentEmojisSet.emojis.indices, id: \.self) { index in
        CardView(isFacedUp: false, content: currentEmojisSet.emojis[index])
          .aspectRatio(0.5, contentMode: .fit)
      }
    }
    .foregroundStyle(currentEmojisSet.color)
  }
  
  var buttons: some View {
    HStack(alignment: .lastTextBaseline) {
      Spacer()
      ThemeButton(text: "Vehicles", imageSystemName: "car") {
        currentEmojisSet = .vehiclesEmojis
      }
      Spacer()
      ThemeButton(text: "Sports", imageSystemName: "figure.run") {
        currentEmojisSet = .sportsEmojis
      }
      Spacer()
      ThemeButton(text: "Countries", imageSystemName: "flag") {
        currentEmojisSet = .countriesEmojis
      }
      Spacer()
    }
    .foregroundStyle(.primary)
  }
  
  private func gridItems(for count: Int) -> [GridItem] {
    switch count {
    case 0..<9:
      return Array(repeatElement(GridItem(), count: 3))
    case 9..<12:
      return Array(repeatElement(GridItem(), count: 4))
    default:
      return Array(repeatElement(GridItem(), count: 5))
    }
    
  }
}

struct EmojiesSet {
  let color: Color
  let emojis: Array<Character>
  
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

struct ThemeButton: View {
  let text: String
  let imageSystemName: String
  let action: () -> Void
  
  var body: some View {
    Button(action: {
      action()
    }, label: {
      VStack(content: {
        Image(systemName: imageSystemName)
          .font(.title)
        Text(text)
          .font(.subheadline)
      })
    })
  }
}

struct CardView: View {
  @State var isFacedUp: Bool = false
  let content: Character
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 10)
      base
        .fill(.white)
      base
        .strokeBorder(style: .init(lineWidth: 2))
      Text(String(content))
        .font(.largeTitle)
      base
        .fill()
        .opacity(isFacedUp ? 0 : 1)
    }
    .onTapGesture {
      isFacedUp.toggle()
    }
  }
}

#Preview {
  ContentView()
}
