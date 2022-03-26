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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
    }
    
    private(set) var cards: [Card]
    private var indexOfOneAndOnlyFaceUpCard: Int?
    
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
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUpCard = choosenIndex
            }
            cards[choosenIndex].isFaceUp.toggle()
        }
    }
}
