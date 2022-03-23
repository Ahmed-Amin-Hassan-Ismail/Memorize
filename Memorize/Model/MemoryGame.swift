//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ahmed Amin on 24/03/2022.
//

import Foundation


struct MemoryGame<CardContent> {
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCard: Int, createCardContent: (Int) -> CardContent) {
        self.cards = []
        for pairIndex in 0..<numberOfPairsOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
}
