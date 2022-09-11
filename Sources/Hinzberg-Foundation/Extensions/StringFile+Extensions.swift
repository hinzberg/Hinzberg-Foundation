//  File.swift
//  Created by Holger Hinzberg on 25.05.22.

import Foundation

public extension String
{
    func appendingPathComponent(_ string: String) -> String
    {
        return URL(fileURLWithPath: self).appendingPathComponent(string).path
    }
    
    func fixEncoding() -> String
    {
        var dummy = self
        dummy = dummy.replacingOccurrences(of: "&#039;", with: "'")
        dummy = dummy.replacingOccurrences(of: "&quot;", with: "\"")
        return dummy
    }
    
    func removeInvalidFilenameCharacters() -> String
    {
        var dummy = self
        dummy = dummy.replacingOccurrences(of: "/", with: " ")
        dummy = dummy.replacingOccurrences(of: ":", with: " ")
        return dummy
    }
}
