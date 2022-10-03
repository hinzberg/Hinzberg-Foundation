import SwiftUI

@available(macOS 10.15, iOS 15, *)
public class BaseRepositoryItem : Identifiable, Equatable, ObservableObject {
    
    @Published public var id = UUID()
    @Published var selected : Bool = false
    
    public static func == (lhs: BaseRepositoryItem, rhs: BaseRepositoryItem) -> Bool {
        return lhs.id == rhs.id
    }
}
