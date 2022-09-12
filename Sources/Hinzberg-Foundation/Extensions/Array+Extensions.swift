//  Array+Extensions
//  Created by Holger Hinzberg on 20.08.21.

import Foundation

public extension Array where Element: Equatable
{
    public var unique: [Element]
    {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
    
    // Sample: let items = itemsToDownload.all(where: { $0.id == item.id })
    func allMatching(where predicate: (Element) -> Bool) -> [Element]
    {
        return self.compactMap { predicate($0) ? $0 : nil }
    }
}
