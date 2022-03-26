//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ahmed Amin on 22/03/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
