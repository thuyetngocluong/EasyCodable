//
//  AwesomeCasting.swift
//  EasyCodable
//
//  Created by Zoro4rk on 9/26/23.
//

import Foundation

infix operator <-
public
extension Int {
    static func <- <K: CodingKey>(lhs: inout Int, rhs: KeyedDecodingInfo<K>) {
        if let newValue = try? rhs.container.decode(Int.self, forKey: rhs.key) {
            lhs = newValue
        } else if let stringValue = try? rhs.container.decode(String.self, forKey: rhs.key) {
            if let casted = Int(stringValue) {
                lhs = casted
            }
        } else if let boolValue = try? rhs.container.decode(Bool.self, forKey: rhs.key) {
            lhs = boolValue ? 1 : 0
        }
    }
}

public
extension String {
    static func <- <K: CodingKey>(lhs: inout String, rhs: KeyedDecodingInfo<K>) {
        if let newValue = try? rhs.container.decode(String.self, forKey: rhs.key) {
            lhs = newValue
        } else if let intValue = try? rhs.container.decode(Int.self, forKey: rhs.key) {
            lhs = String(intValue)
        } else if let doubleValue = try? rhs.container.decode(Double.self, forKey: rhs.key) {
            lhs = String(doubleValue)
        } else if let boolValue = try? rhs.container.decode(Bool.self, forKey: rhs.key) {
            lhs =  boolValue ?  "1" : "0"
        }
    }
}

public
extension Bool {
    static func <- <K: CodingKey>(lhs: inout Bool, rhs: KeyedDecodingInfo<K>) {
        if let newValue = try? rhs.container.decode(Bool.self, forKey: rhs.key) {
            lhs = newValue
        } else if let intValue = try? rhs.container.decode(Int.self, forKey: rhs.key) {
            lhs = intValue == 1 ? true : false
        } else if let stringValue = try? rhs.container.decode(String.self, forKey: rhs.key) {
            lhs = stringValue == "1" ? true : false
        }
    }
}

public
extension Double {
    static func <- <K: CodingKey>(lhs: inout Double, rhs: KeyedDecodingInfo<K>) {
        if let newValue = try? rhs.container.decode(Double.self, forKey: rhs.key) {
            lhs = newValue
        } else if let stringValue = try? rhs.container.decode(String.self, forKey: rhs.key) {
            if let casted = Double(stringValue) {
                lhs = casted
            }
        } else if let boolValue = try? rhs.container.decode(Bool.self, forKey: rhs.key) {
            lhs = boolValue ? 1 : 0
        }
    }
}
