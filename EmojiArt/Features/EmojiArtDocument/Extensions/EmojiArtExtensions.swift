//
//  EmojiArtExtensions.swift
//  EmojiArt
//
//  Created by Rodrigo Francisco on 30/11/22.
//

import SwiftUI

extension Collection where Element: Identifiable {
    func firstIndex(matching element: Element) -> Self.Index? {
        firstIndex(where: { $0.id == element.id })
    }
    // note that contains(matching:) is different than contains()
    // this version uses the Identifiable-ness of its elements
    // to see whether a member of the Collection has the same identity
    func contains(matching element: Element) -> Bool {
        self.contains(where: { $0.id == element.id })
    }
}

extension Data {
    // just a simple converter from a Data to a String
    var utf8: String? { String(data: self, encoding: .utf8 ) }
}


extension GeometryProxy {
    // converts from some other coordinate space to the proxy's own
    func convert(_ point: CGPoint, from coordinateSpace: CoordinateSpace) -> CGPoint {
        let frame = self.frame(in: coordinateSpace)
        return CGPoint(x: point.x-frame.origin.x, y: point.y-frame.origin.y)
    }
}

extension String {
    // returns ourself without any duplicate Characters
    // not very efficient, so only for use on small-ish Strings
    func uniqued() -> String {
        var uniqued = ""
        for ch in self {
            if !uniqued.contains(ch) {
                uniqued.append(ch)
            }
        }
        return uniqued
    }
}

extension String
{
    // returns ourself but with numbers appended to the end
    // if necessary to make ourself unique with respect to those other Strings
    func uniqued<StringCollection>(withRespectTo otherStrings: StringCollection) -> String
        where StringCollection: Collection, StringCollection.Element == String {
        var unique = self
        while otherStrings.contains(unique) {
            unique = unique.incremented
        }
        return unique
    }
    
    // if a number is at the end of this String
    // this increments that number
    // otherwise, it appends the number 1
    var incremented: String  {
        let prefix = String(self.reversed().drop(while: { $0.isNumber }).reversed())
        if let number = Int(self.dropFirst(prefix.count)) {
            return "\(prefix)\(number+1)"
        } else {
            return "\(self) 1"
        }
    }
}

extension UIImage {
    // Lecture 14 support
    // stores ourself as jpeg in a file in the filesystem
    // in the Application Support directory in our sandbox
    // with the given name (or a unique name if no name provided)
    // and returns the URL to it
    // care must be taken if you hold on to a URL like this persistently
    // because your Application Support directory's URL
    // can change between instances of your application
    // (see some hackery in imageURL above to account for this)
    // if you wanted to hold on to a URL like this in the real world
    // (i.e. not in demo-ware)
    // you'd probably just hold onto the end part of the URL
    // (i.e. not including the Application Support directory's URL)
    // and then always prepend Application Support's URL upon use of the URL fragment
    // this function might also want to add a parameter for the compression quality
    // (currently it is best-quality compression)
    func storeInFilesystem(name: String = "\(Date().timeIntervalSince1970)") -> URL? {
        var url = try? FileManager.default.url(
            for: .applicationSupportDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        url = url?.appendingPathComponent(name)
        if url != nil {
            do {
                try self.jpegData(compressionQuality: 1.0)?.write(to: url!)
            } catch {
                url = nil
            }
        }
        return url
    }
}


//extension EmojiArt.Emoji {
//    var fontSize: CGFloat {
//        CGFloat(self.size)
//    }
//    
//    var location: CGPoint {
//        CGPoint(x: CGFloat(x), y: CGFloat(y))
//    }
//}
