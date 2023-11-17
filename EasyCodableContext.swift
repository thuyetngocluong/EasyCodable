//
//  EasyCodableContext.swift
//  EasyCodable
//
//  Created by Zoro4rk on 17/11/2023.
//

import Foundation

extension String: CodingKey {
    public init?(intValue: Int) { self = String(intValue) }
    public init?(stringValue: String) { self = stringValue }
    public var stringValue: String { self }
    public var intValue: Int? { Int(self) }
}

private let contextKey = CodingUserInfoKey(rawValue: "EasyCodableContext")

public extension JSONDecoder {
    func decode<T>(_ type: T.Type, from data: Data, with context: ECMappingContext) throws -> T where T: Decodable {
        if let contextKey = contextKey {
            self.userInfo[contextKey] = context
        }
        return try self.decode(type, from: data)
    }
}

public protocol ECMappingContext {}

public protocol ECContextedCodable: Codable {
    init()
    mutating func mapping(container: KeyedDecodingContainer<String>, context: ECMappingContext?)
}

extension ECContextedCodable {
    public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: String.self)
        if let key = contextKey,
           let context = decoder.userInfo[key] as? ECMappingContext {
            mapping(container: container, context: context)
        } else {
            mapping(container: container, context: nil)
        }
    }
}
