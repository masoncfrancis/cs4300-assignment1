//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mason Francis on 1/28/22.
//

import SwiftUI

func makeCardContent(index: Int) -> String {
    return "💩"
}

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private struct Theme {
        var name: String
        var emojis: [String]
        var color: Color
        var pairCount: Int
    }
    
    private var themes = [
        Theme(name: "Faces", emojis: ["😀", "😅", "😂", "🥲", "😇", "😉", "😍", "🥰", "😘", "😜", "🤓", "😎", "🥸", "🤩", "🥳", "😔", "☹️", "😫", "🥺", "😡"], color: .yellow, pairCount: 19),
        Theme(name: "Transportation", emojis:  ["🚗", "🚕", "🚎", "🚑", "🛻", "🚜", "🛴", "🚲", "🛵", "🏍", "🚠", "🚃", "✈️", "🚀", "🚁", "⛵️", "🚢", "🛶", "🛸", "🦼"], color: .blue, pairCount: 18),
        Theme(name: "Foods", emojis: ["🍎", "🍊", "🍋", "🍌", "🥥", "🌶", "🥕", "🥨", "🧀", "🥓", "🧇", "🥩", "🍔", "🍟", "🍕", "🌮", "🍝", "🍤", "🍭", "🍿"], color: .yellow, pairCount: 20),
        Theme(name: "Flags", emojis: ["🇦🇴", "🇨🇿", "🇦🇫", "🇧🇷", "🇦🇺", "🇦🇬", "🇧🇧", "🇧🇮", "🇧🇹", "🇰🇷", "🇺🇸", "🇬🇲", "🇬🇷", "🇬🇪", "🇰🇾", "🇯🇲", "🇯🇵", "🇱🇷", "🇳🇴", "🇬🇧", "🇵🇷", "🇲🇽"], color: .green, pairCount: 10),
        Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐰", "🦊", "🐼", "🐻", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🦆", "🦉", "🐴", "🦄"], color: .orange, pairCount: 15),
        Theme(name: "Hearts", emojis: ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔", "❣️", "💕", "💞", "💓", "💗", "💖", "💘", "💝", "💟"], color: .red, pairCount: 10)
        
    ]
    
    private static let emojis = ["💩", "🌚", "🔥", "🍕", "😡", "🦨", "🦀"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberofPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
    
        }
    }
    
    
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    
    var cards: Array<Card> {
        return model.cards
    }
    
    
    
    // MARK: -Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
