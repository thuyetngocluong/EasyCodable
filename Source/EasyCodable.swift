//
//  EasyCodable.swift
//  EasyCodable
//
//  Created by Zoro4rk on 9/26/23.
//

import Foundation


public typealias KeyedDecodingInfo<K: CodingKey> = (container: KeyedDecodingContainer<K>, key: K)
public extension KeyedDecodingContainer {
    subscript(i: K) -> KeyedDecodingInfo<K> {
        return (self, i)
    }
}

infix operator <-
public extension Decodable {
    typealias Casting = (Decodable) -> Self?
    typealias KeyedDecodingInfoWithCasting<K: CodingKey> = (info: KeyedDecodingInfo<K>, ifCastFailure: (KeyedDecodingContainer<K>) -> Self?)
    
    static func <- <K: CodingKey>(lhs: inout Self, rhs: KeyedDecodingInfo<K>) {
        if let newValue = try? rhs.container.decode(Self.self, forKey: rhs.key) {
            lhs = newValue
        }
    }
    
    static func <- <K: CodingKey>(lhs: inout Self, rhs: KeyedDecodingInfoWithCasting<K>) {
        if let newValue = (try? rhs.info.container.decode(Self.self, forKey: rhs.info.key)) ?? rhs.ifCastFailure(rhs.info.container) {
            lhs = newValue
        }
    }
}
