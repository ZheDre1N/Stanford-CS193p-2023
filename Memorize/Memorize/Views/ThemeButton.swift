//
//  ThemeButton.swift
//  Memorize
//
//  Created by Eugene Dudkin on 05.09.2023.
//

import SwiftUI

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
