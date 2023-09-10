//
//  CardView.swift
//  Memorize
//
//  Created by Eugene Dudkin on 05.09.2023.
//

import SwiftUI

struct CardView: View {
  @Binding var isFacedUp: Bool
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
