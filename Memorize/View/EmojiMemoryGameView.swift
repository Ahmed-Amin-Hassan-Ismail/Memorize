//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ahmed Amin on 22/03/2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        AspectRatio(items: viewModel.cards, aspectRatio: 2/3) { card in
        CardView(card)
            .padding(4)
            .aspectRatio(2/3, contentMode: .fit)
            .onTapGesture {
                viewModel.choose(card)
                
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.light)
        EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}


protocol Identifiablity {
    associatedtype ID: Hashable
    var id: ID { get }
}
