//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ahmed Amin on 24/03/2022.
//

import Foundation
import SwiftUI


struct MemoryGame<CardContent> {
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
    }
    
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCard: Int, createCardContent: (Int) -> CardContent) {
        self.cards = []
        for pairIndex in 0..<numberOfPairsOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    mutating func choose(_ card: Card) {
        let choosenIndex = index(of: card)
        cards[choosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id  {
                return index
            }
        }
        return 0 // bougs
    }
    
}
