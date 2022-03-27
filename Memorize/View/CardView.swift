//
//  CardView.swift
//  Memorize
//
//  Created by Ahmed Amin on 27/03/2022.
//

import SwiftUI

struct CardView: View {
    private let card: EmojiMemoryGame.Card
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape
                    .fill()
            }
            
        }
        .foregroundColor(.red)
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(MemoryGame<String>.Card(content: "🧫", id: 0))
    }
}
