//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Eugene Dudkin on 02.09.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject private var gameViewModel = EmojiGameViewModel()
  
    var body: some Scene {
        WindowGroup {
          EmojiGameView(viewModel: gameViewModel)
        }
    }
}
