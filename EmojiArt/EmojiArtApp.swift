//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Rodrigo Francisco on 30/11/22.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    let document = EmojiArtDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
