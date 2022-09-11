//  Array+Extensions
//  Created by Holger Hinzberg on 20.08.21.

import Foundation

public extension Array where Element: Equatable
{
    public var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
}
