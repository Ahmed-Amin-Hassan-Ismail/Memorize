//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ahmed Amin on 24/03/2022.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚗","✈️","🚀","🚁","🚤","🚕","🚎","🦼","🛴","🛺","🚔","🚠","🚟","🚃","🚝","🚄","🚈","🚂","🚆","🚧","🚏","⛽️","⚓️","🪝","🛳","⛵️"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCard: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    var cards: Array<Card> {
        return model.cards
    }
    
    //MARK: - Intent
    func choose(_ card: Card) {
        model.choose(card)
    }
}
