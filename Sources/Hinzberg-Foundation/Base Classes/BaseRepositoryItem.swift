import SwiftUI

@available(macOS 10.15, iOS 15, *)
open class BaseRepositoryItem : Identifiable, Equatable, ObservableObject {
    
    @Published public var id = UUID()
    @Published public var selected : Bool = false
    
    public init() {
        
    }
    
    public static func == (lhs: BaseRepositoryItem, rhs: BaseRepositoryItem) -> Bool {
        return lhs.id == rhs.id
    }
}
