//
//  ECCodable.swift
//  EasyCodable
//
//  Created by Zoro4rk on 5/8/24.
//

import Foundation


public protocol ECCodable: Codable {
    init()
}


extension ECCodable {
    private var keyPathReadableFormat: [String: Any] {
        var description: [String: Any] = [:]
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
            description[label] = value
        }
        return description
    }
}

extension ECCodable {
    public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: String.self)
        for (key, value) in keyPathReadableFormat {
            if let value = value as? _JsonProperties {
                let realKey = value.decodeKey ?? String(key[key.index(key.startIndex, offsetBy: 1)...])
                if let decoded = value.codableRawValue.get(from: container, for: realKey) {
                    var copy = value
                    copy.codableRawValue = decoded
                }
            }
        }
    }
}
