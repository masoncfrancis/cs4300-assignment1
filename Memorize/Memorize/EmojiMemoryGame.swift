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
    
    public struct Theme {
        var name: String
        var emojis: [String]
        var color: Color
        var pairCount: Int
    }
    
    private static var themes = [
        Theme(name: "Faces", emojis: ["😀", "😅", "😂", "🥲", "😇", "😉", "😍", "🥰", "😘", "😜", "🤓", "😎", "🥸", "🤩", "🥳", "😔", "☹️", "😫", "🥺", "😡"], color: .yellow, pairCount: 8),
        Theme(name: "Transportation", emojis:  ["🚗", "🚕", "🚎", "🚑", "🛻", "🚜", "🛴", "🚲", "🛵", "🏍", "🚠", "🚃", "✈️", "🚀", "🚁", "⛵️", "🚢", "🛶", "🛸", "🦼"], color: .blue, pairCount: 9),
        Theme(name: "Foods", emojis: ["🍎", "🍊", "🍋", "🍌", "🥥", "🌶", "🥕", "🥨", "🧀", "🥓", "🧇", "🥩", "🍔", "🍟", "🍕", "🌮", "🍝", "🍤", "🍭", "🍿"], color: .yellow, pairCount: 10),
        Theme(name: "Flags", emojis: ["🇦🇴", "🇨🇿", "🇦🇫", "🇧🇷", "🇦🇺", "🇦🇬", "🇧🇧", "🇧🇮", "🇧🇹", "🇰🇷", "🇺🇸", "🇬🇲", "🇬🇷", "🇬🇪", "🇰🇾", "🇯🇲", "🇯🇵", "🇱🇷", "🇳🇴", "🇬🇧", "🇵🇷", "🇲🇽"], color: .green, pairCount: 10),
        Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐰", "🦊", "🐼", "🐻", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵", "🐔", "🐧", "🐦", "🦆", "🦉", "🐴", "🦄"], color: .orange, pairCount: 11),
        Theme(name: "Hearts", emojis: ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔", "❣️", "💕", "💞", "💓", "💗", "💖", "💘", "💝", "💟"], color: .red, pairCount: 10)
        
    ]
    
//    private static let emojis = ["💩", "🌚", "🔥", "🍕", "😡", "🦨", "🦀"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        
        themes.shuffle()
        themes[0].emojis.shuffle()
        return MemoryGame<String>(numberofPairsOfCards: themes[0].pairCount, cardColor: themes[0].color) { pairIndex in
            themes[0].emojis[pairIndex]
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
