//
//  PaletteStore.swift
//  EmojiArt
//
//  Created by Rodrigo Francisco on 14/12/22.
//

import SwiftUI

struct Palette: Identifiable, Codable {
    var name: String
    var emojis: String
    
    var id: Int
    
    fileprivate init(name: String, emojis: String, id: Int) {
        self.name = name
        self.emojis = emojis
        self.id = id
    }
}

class PaletteStore: ObservableObject {
    let name: String
    
    @Published var palettes = [Palette]() {
        didSet {
            storeInUserDefaults()
        }
    }
    
    init(named name: String) {
        self.name = name
        restoreFromUserDefaults()
        if palettes.isEmpty {
            print("Using built-in palettes")
            insertPalette(named: "Faces", emojis: "😀😅😂😇🥰😉🙃😎🥳😡🤯🥶🤥😴🙄👿😷🤧🤡")
            insertPalette(named: "Food", emojis: "🍏🍎🥒🍞🥨🥓🍔🍟🍕🍰🍿☕️")
            insertPalette(named: "Animals", emojis: "🐶🐼🐵🙈🙉🙊🦆🐝🕷🐟🦓🐪🦒🦨")
            insertPalette(named: "Activities", emojis: "⚽️🏈⚾️🎾🏐🏓⛳️🥌⛷🚴‍♂️🎳🎼🎭🪂")
        } else {
            print("Successfully loaded palettes form UserDefaults")
        }
    }
    
    private var userDefaultsKey: String {
        "PaletteStore:" + name
    }
    
    private func storeInUserDefaults() {
        UserDefaults.standard.set(try? JSONEncoder().encode(palettes), forKey: userDefaultsKey)
    }
    
    private func restoreFromUserDefaults() {
        if let jsonData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decodedPalettes = try? JSONDecoder().decode([Palette].self, from: jsonData) {
            palettes = decodedPalettes
        }
    }
    
    func palette(at index: Int) -> Palette {
        let safeIndex = min(max(index,0), palettes.count - 1)
        return palettes[safeIndex]
    }
    
    @discardableResult func removePalette(at index: Int) -> Int {
        if palettes.count > 1, palettes.indices.contains(index) {
            palettes.remove(at: index)
        }
        
        return index % palettes.count
    }
    
    func insertPalette(named name: String, emojis: String? = nil, at index: Int = 0) {
        let unique = (palettes.max(by: { $0.id < $1.id })?.id ?? 0) + 1
        let palette = Palette(name: name, emojis: emojis ?? "", id: unique)
        let safeIndex = min(max(index, 0), palettes.count)
        palettes.insert(palette, at: safeIndex)
    }
}
