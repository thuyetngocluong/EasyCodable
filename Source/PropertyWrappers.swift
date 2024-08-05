//
//  PropertyWrappers.swift
//  EasyCodable
//
//  Created by Zoro4rk on 5/8/24.
//

import Foundation


protocol _JsonProperties {
    var codableRawValue : Codable { get set }
    var decodeKey       : String? { get }
    var encodeKey       : String? { get }
}

private
class _JsonPropertiesInnerClass<Value> {
    var wrapperValue: Value
    init(wrapperValue: Value) {
        self.wrapperValue = wrapperValue
    }
}

@propertyWrapper
public struct JsonProperties<Value: Codable>: Codable, _JsonProperties {
        
    public var wrappedValue: Value {
        get {
            innerClass.wrapperValue
        }
        set {
            innerClass = _JsonPropertiesInnerClass(wrapperValue: newValue)
        }
    }
    
    var codableRawValue: any Codable {
        get {
            wrappedValue
        }
        set {
            if let newValue = newValue as? Value {
                self.innerClass.wrapperValue = newValue
            }
        }
    }
    
    var decodeKey : String?
    var encodeKey : String?
    
    private var innerClass: _JsonPropertiesInnerClass<Value>
    
    public init(wrappedValue: Value, decodeKey: String? = nil, encodeKey: String? = nil) {
        self.innerClass = _JsonPropertiesInnerClass(wrapperValue: wrappedValue)
        self.decodeKey = decodeKey
        self.encodeKey = encodeKey
    }
    
    public init(from decoder: any Decoder) throws {
        fatalError()
    }
    
    public func encode(to encoder: any Encoder) throws {
        fatalError()
    }
}
