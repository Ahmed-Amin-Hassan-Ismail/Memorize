//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ahmed Amin on 24/03/2022.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚗","✈️","🚀","🚁","🚤","🚕","🚎","🦼","🛴","🛺","🚔","🚠","🚟","🚃","🚝","🚄","🚈","🚂","🚆","🚧","🚏","⛽️","⚓️","🪝","🛳","⛵️"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCard: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Instant
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
