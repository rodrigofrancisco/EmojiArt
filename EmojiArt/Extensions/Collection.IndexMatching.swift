//
//  Collection.IndexMatching.swift
//  EmojiArt
//
//  Created by Rodrigo Francisco on 30/11/22.
//

import SwiftUI

extension Collection where Element: Identifiable {
    func index(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
}
