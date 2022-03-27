//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ahmed Amin on 24/03/2022.
//

import Foundation
import SwiftUI


struct MemoryGame<CardContent> where CardContent: Equatable {
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
        
    }
    
    private(set) var cards: [Card]
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }}
    }
    
    init(numberOfPairsOfCard: Int, createCardContent: (Int) -> CardContent) {
        self.cards = []
        for pairIndex in 0..<numberOfPairsOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let choosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[choosenIndex].isFaceUp,
           !cards[choosenIndex].isMatched {
            if let potentialMatch = indexOfOneAndOnlyFaceUpCard {
                if cards[choosenIndex].content == cards[potentialMatch].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatch].isMatched = true
                }
                cards[choosenIndex].isFaceUp.toggle()
            } else {
                indexOfOneAndOnlyFaceUpCard = choosenIndex
            }
            
        }
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
