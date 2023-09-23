//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Eugene Dudkin on 02.09.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var viewModel = EmojiMemoryGameViewModel()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: viewModel)
        }
    }
}
