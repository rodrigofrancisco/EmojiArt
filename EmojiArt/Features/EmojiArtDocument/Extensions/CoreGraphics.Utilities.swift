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

extension CGSize {
    static func +(lhs: Self, rhs: Self) -> CGSize {
        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
    static func -(lhs: Self, rhs: Self) -> CGSize {
        CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    static func *(lhs: Self, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
    static func /(lhs: Self, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width/rhs, height: lhs.height/rhs)
    }
}
