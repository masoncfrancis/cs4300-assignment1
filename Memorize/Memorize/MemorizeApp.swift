//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Mason Francis on 1/14/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
