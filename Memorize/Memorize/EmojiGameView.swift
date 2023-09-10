//
//  ContentView.swift
//  Memorize
//
//  Created by Eugene Dudkin on 02.09.2023.
//

import SwiftUI

struct EmojiGameView: View {
  @ObservedObject var viewModel: EmojiGameViewModel

  var body: some View {
    NavigationStack {
        VStack {
          ScrollView { cards }.scrollIndicators(.hidden)
          buttons
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .navigationTitle("Memorize!")
        .navigationBarTitleDisplayMode(.large)
    }
  }
  
  var cards: some View {
    LazyVGrid(columns: gridItems(for: viewModel.gameModel.cards.count))  {
      ForEach(viewModel.gameModel.cards.indices, id: \.self) { index in
        CardView(isFacedUp: $viewModel.gameModel.cards[index].isFacedUp, content: viewModel.gameModel.cards[index].content)
          .aspectRatio(0.5, contentMode: .fit)
      }
    }
    .foregroundStyle(viewModel.gameModel.currentColor)
  }
  
  var buttons: some View {
    VStack {
      Button(action: {
        viewModel.gameModel.shuffle()
      }, label: {
        Text("Shuffle")
      })
      .foregroundStyle(viewModel.selectedIndex == -1 ? .secondary : .primary)
      .disabled(viewModel.selectedIndex == -1)
      HStack(alignment: .lastTextBaseline) {
        Spacer()
        ThemeButton(text: "Vehicles", imageSystemName: "car") {
          viewModel.startEmojiGame(contentType: .vehiclesEmojis, repeating: 2, contentIndex: 0)
        }
        .foregroundStyle(viewModel.selectedIndex == 0 ? .primary : .secondary)
        Spacer()
        ThemeButton(text: "Sports", imageSystemName: "figure.run") {
          viewModel.startEmojiGame(contentType: .sportsEmojis, repeating: 2, contentIndex: 1)
        }
        .foregroundStyle(viewModel.selectedIndex == 1 ? .primary : .secondary)
        Spacer()
        ThemeButton(text: "Countries", imageSystemName: "flag") {
          viewModel.startEmojiGame(contentType: .countriesEmojis, repeating: 2, contentIndex: 2)
        }
        .foregroundStyle(viewModel.selectedIndex == 2 ? .primary : .secondary)
        Spacer()
      }
      .foregroundStyle(.primary)
    }
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

#Preview {
  @StateObject var viewModel = EmojiGameViewModel()
  return EmojiGameView(viewModel: viewModel)
}
