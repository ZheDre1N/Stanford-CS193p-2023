//
//  ContentView.swift
//  Memorize
//
//  Created by Eugene Dudkin on 02.09.2023.
//

import SwiftUI

struct ContentView: View {
  @State var emojis = ["🤯", "😎", "🍔", "🎲"]

  var body: some View {
    VStack {
      ScrollView {
        cards
      }
      buttons
    }
    .padding()
  }
  
  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))])  {
      ForEach(emojis.indices, id: \.self) { index in
        CardView(isFacedUp: true, content: emojis[index])
          .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .foregroundStyle(.blue)
  }
  
  @ViewBuilder
  var buttons: some View {
      Button("Add card") {
        emojis.append(emojis.randomElement()!)
      }
      .foregroundStyle(.blue)
      Button("Reset") {
        emojis = ["🤯", "😎", "🍔", "🎲"]
      }
  }
}

struct CardView: View {
  @State var isFacedUp: Bool = false
  let content: String
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 10)

      Group {
        base.fill(.white)
        base.strokeBorder(style: .init(lineWidth: 2))
        Text(content).font(.largeTitle)
      }
      base.fill().opacity(isFacedUp ? 0 : 1)
    }
    .onTapGesture {
      isFacedUp.toggle()
    }
  }
}

#Preview {
  ContentView()
}
