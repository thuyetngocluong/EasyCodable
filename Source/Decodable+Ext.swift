//
//  Decodeable+Ext.swift
//  EasyCodable
//
//  Created by Zoro4rk on 5/8/24.
//

extension Decodable {
    func get(from container: KeyedDecodingContainer<String>, for key: String) -> Self? {
        var c: Self?
        c <- container[key]
        return c
    }
}
