//
//  ContentView.swift
//  Memorize
//
//  Created by Ahmed Amin on 22/03/2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗","✈️","🚀","🚁","🚤","🚕","🚎","🦼","🛴","🛺","🚔","🚠","🚟","🚃","🚝","🚄","🚈","🚂","🚆","🚧","🚏","⛽️","⚓️","🪝","🛳","⛵️"]
    @State var emojiCount = 4
    
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            
            HStack {
                removeEmoji
                Spacer()
                addEmoji
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        
    }
}

//MARK: - Remove Emoji
extension ContentView {
    var removeEmoji: some View {
        Button {
            if self.emojiCount > 1 {
                self.emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
        
    }
}

//MARK: - Add Emoji
extension ContentView {
    var addEmoji: some View {
        Button {
            if self.emojiCount < emojis.count {
                self.emojiCount += 1
            }
            
        } label: {
            Image(systemName: "plus.circle")
                
        }
        
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .foregroundColor(.red)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
