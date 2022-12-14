//  RepositoryProtocol.swift
//  Created by Holger Hinzberg on 30.08.22.

import Foundation
public protocol RepositoryProtocol {
    
    associatedtype RepositoryType
    
    func getCount() -> Int
    func add( item:RepositoryType ) -> Void
    func addMany( items:[RepositoryType] ) -> Void
    func remove( item:RepositoryType ) -> Void
    func removeMany( items:[RepositoryType] ) -> Void
    func getAll() -> [RepositoryType]
    func get(id:UUID) ->RepositoryType?
    func clear() -> Void
}
