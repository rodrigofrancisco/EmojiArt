//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Rodrigo Francisco on 12/12/22.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        if uiImage != nil {
            Image(uiImage: uiImage!)
        }
    }
}
