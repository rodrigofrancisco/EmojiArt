//
//  Character.IsEmoji.swift
//  EmojiArt
//
//  Created by Rodrigo Francisco on 30/11/22.
//

import Foundation

extension Character {
    var isEmoji: Bool {
        if let firstScalar = unicodeScalars.first, firstScalar.properties.isEmoji {
            return (firstScalar.value >= 0x238d || unicodeScalars.count > 1)
        } else {
            return false
        }
    }
}
