# EasyCodable
Codable syntax like [ObjectMapper](https://github.com/tristanhimmelman/ObjectMapper) and not throw error

## Example

```
struct Ball: Codable {
    var weight: Double
    var colorHex: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.weight <- container[.weight]
        self.colorHex <- container[.colorHex]
    }
}
```

## Requirements

## Installation

EasyCodable is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'EasyCodable'
```

## Author

Zoro4rk, thuyetngocluong@gmail.com

## License

EasyCodable is available under the MIT license. See the LICENSE file for more info.
