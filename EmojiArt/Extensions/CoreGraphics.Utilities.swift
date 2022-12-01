//
//  CoreGraphics.Utilities.swift
//  EmojiArt
//
//  Created by Rodrigo Francisco on 30/11/22.
//

import CoreGraphics

extension CGRect {
    var center: CGPoint {
        CGPoint(x: midX, y: midY)
    }
}

extension CGPoint {
    static func -(lhs: Self, rhs: Self) -> CGSize {
        CGSize(width: lhs.x - rhs.x, height: lhs.y - rhs.y)
    }
    static func +(lhs: Self, rhs: Self) -> CGSize {
        CGSize(width: lhs.x + rhs.x, height: lhs.y + rhs.y)
    }
    
    static func *(lhs: Self, rhs: Self) -> CGSize {
        CGSize(width: lhs.x * rhs.x, height: lhs.y * rhs.y)
    }
    
    static func /(lhs: Self, rhs: Self) -> CGSize {
        CGSize(width: lhs.x / rhs.x, height: lhs.y / rhs.y)
    }
}
