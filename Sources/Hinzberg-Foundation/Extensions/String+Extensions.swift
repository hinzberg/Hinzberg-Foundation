//  String+Extensions
//  Copyright (c) 2022 Holger Hinzberg. All rights reserved.

import Foundation

public extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    func trim(characterSet : CharacterSet) -> String
    {
        return self.trimmingCharacters(in: characterSet)
    }
            
    // MARK: - left & right
    
    public func left(characterCount : Int) -> String
    {
        if characterCount > 0 && characterCount < self.count
        {
            let sub = String(self[..<self.index(self.startIndex, offsetBy: characterCount)])
            return sub
        }
        return self
    }
    
    public func right(characterCount : Int) -> String
    {
        if characterCount > 0 && characterCount < self.count
        {
            let sub = String(self[self.index(self.endIndex, offsetBy: (characterCount * -1))...])
            return sub
        }
        return self
    }
    
    // MARK: - Case Insensitive Comparision
    
    public func caseInsensitiveEndsWith(searchString:String)->Bool
    {
        let indexOfAnotherString = getIndexOf(searchString: searchString, options: NSString.CompareOptions.caseInsensitive)
        if let indexOfAnotherString = indexOfAnotherString
        {
            let endIndex:Int = self.count - searchString.count
            if indexOfAnotherString == endIndex
            {
                return true
            }
        }
        return false
    }
    
    public func caseInsensitiveBeginsWith(searchString:String)->Bool
    {
        let indexOfAnotherString = getIndexOf(searchString: searchString, options: NSString.CompareOptions.caseInsensitive)
        if let indexOfAnotherString = indexOfAnotherString
        {
            if indexOfAnotherString == 0
            {
                return true
            }
        }
        return false
    }
        
    public func caseInsensitiveContains(searchString:String) -> Bool
    {
        if (self.lowercased().contains(searchString.lowercased()))
        {
            return true
        }
        return false
    }
    
    // MARK: - Substring Operations
    
    public func getIndexOf(searchString:String, options: NSString.CompareOptions? = nil)->Int?
    {
        var theRange : Range<String.Index>?
        if let options = options
        {
            theRange = self.range(of: searchString, options: options)
        }
        else
        {
            theRange = self.range(of: searchString)
        }
        
        if let theRange = theRange
        {
            let index: Int = self.distance(from: self.startIndex, to: theRange.lowerBound)
            return index
        }
        return nil
    }

    public func substringBefore(searchString:String, options: NSString.CompareOptions? = nil) ->String
    {
        var theRange : Range<String.Index>?
        if let options = options
        {
            theRange = self.range(of: searchString, options: options)
        }
        else
        {
            theRange = self.range(of: searchString)
        }

        if let theRange = theRange
        {
            let endIndex = theRange.lowerBound
            let str = String(self[self.startIndex..<endIndex])
            return str
        }
        return self
    }
    
    public func substringBeforeIncluding(searchString:String, options: NSString.CompareOptions? = nil) ->String
    {
        var theRange : Range<String.Index>?
        if let options = options
        {
            theRange = self.range(of: searchString, options: options)
        }
        else
        {
            theRange = self.range(of: searchString)
        }

        if let theRange = theRange
        {
            let endIndex = theRange.upperBound
            let str = String(self[self.startIndex..<endIndex])
            return str
        }
        return self
    }
        
    public func substringAfter(searchString:String, options: NSString.CompareOptions? = nil) ->String
    {
        var theRange : Range<String.Index>?
        if let options = options
        {
            theRange = self.range(of: searchString, options: options)
        }
        else
        {
            theRange = self.range(of: searchString)
        }
        
        if let theRange = theRange
        {
            let str = String(self[theRange.upperBound..<self.endIndex])
            return str
        }
        return self
    }
    
    public func substringAfterIncluding(searchString:String, options: NSString.CompareOptions? = nil) ->String
    {
        var theRange : Range<String.Index>?
        if let options = options
        {
            theRange = self.range(of: searchString, options: options)
        }
        else
        {
            theRange = self.range(of: searchString)
        }
        
        if let theRange = theRange
        {
            let str = String(self[theRange.lowerBound..<self.endIndex])
            return str
        }
        return self
    }
    
    
    public func substringRightAfter(characterCount:Int) -> String
    {
        if characterCount > 0 && characterCount < self.count
        {
            let sub = String(self[self.index(self.startIndex, offsetBy: characterCount)...])
            return sub
        }
        return self
    }
        
    public func substringLeftBefore(characterCount:Int) -> String
    {
        if characterCount > 0 && characterCount < self.count
        {
            let sub = String(self[..<self.index(self.startIndex, offsetBy: self.count - characterCount)])
            return sub
        }
        return self
    }
    
    public func substringBetween(startString:String, endString:String) -> (String)
    {
        var source = self
        
        if source.caseInsensitiveContains(searchString: startString)
        {
            source = source.substringAfter(searchString: startString)
            if source.caseInsensitiveContains(searchString: endString)
            {
                source = source.substringBefore(searchString: endString)
                return source
            }
        }
        return ""
    }
    
    
    public func removePrefix(_ prefix: String) -> String
    {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    public func removeSuffix(_ suffix: String) -> String
    {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
    
    public func firstCharacterUppercase() -> String
    {
        var isFirst = true
        var newString = ""
        let characters = Array(self)
        
        for char in characters {
            if isFirst {
                newString = char.uppercased()
            } else {
                newString += String(char)
            }
            isFirst = false
        }
        return newString
    }
    
    public func capitalizeWords() -> String
    {
        var newString = "";
        let array = self.components(separatedBy: " ")
        for word in array {
            newString += word.firstCharacterUppercase()
            if word != array.last {
                newString += " "
            }
        }
        return newString
    }
    
    //MARK: Deprecated functions
    
    @available(*, deprecated, message: "Use substringAfter instead")
    public func substringRightOf(searchString:String) ->String
    {
        let theRange = self.range(of: searchString)
        if let theRange = theRange
        {
            let str = String(self[theRange.upperBound..<self.endIndex])
            return str
        }
        return self
    }
    
    @available(*, deprecated, message: "Use substringBefore instead")
    public func substringLeftOf(searchString:String) ->String
    {
        let theRange = self.range(of: searchString)
        if let theRange = theRange
        {
            let endIndex = theRange.lowerBound
            let str = String(self[self.startIndex..<endIndex])
            return str
        }
        return self
    }
}
