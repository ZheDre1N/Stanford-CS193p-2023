//
//  ContentView.swift
//  Memorize
//
//  Created by Eugene Dudkin on 02.09.2023.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(content: {
      HStack(content: {
        CardView()
        CardView()
        CardView()
      })
      HStack(content: {
        CardView()
        CardView(isFacedUp: true)
        CardView()
      })
      HStack(content: {
        CardView()
        CardView()
        CardView()
      })
    })
    .foregroundStyle(.orange)
    .padding()
  }
}

struct CardView: View {
  var isFacedUp: Bool = false
  
  var body: some View {
    ZStack(content: {
      if isFacedUp {
        RoundedRectangle(cornerRadius: 12)
          .foregroundStyle(.white)
        RoundedRectangle(cornerRadius: 12)
          .strokeBorder(style: .init(lineWidth: 2))
        Text("🤯")
          .font(.largeTitle)
      } else {
        RoundedRectangle(cornerRadius: 12)
      }
    })
  }
}

#Preview {
  ContentView()
}
