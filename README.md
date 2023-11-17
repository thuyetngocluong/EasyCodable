# EasyCodable
Codable syntax like [ObjectMapper](https://github.com/tristanhimmelman/ObjectMapper) and not throw error

## Example

### 1. Normal Codable
```
struct Ball: Codable {
    var weight: Double = .zero
    var colorHex: String = ""

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.weight <- container[.weight]
        self.colorHex <- container[.colorHex]
    }
}
```


### 2. Codable With multi context

```
enum VehicleMappingContext: ECMappingContext {
    case bike
    case motobike
}

class Verhicle: ECContextedCodable {

    var name: String = ""

    required init() {}

    func mapping(container: KeyedDecodingContainer<String>, context:.ECMappingContext?) {
        switch context {
            case let c as VehicleMappingContext where  c == .bike:
                self.name <- container["bike_name"]
            case let  c  as  VehicleMappingContext where  c == .motobike:
                self.name <- container["motobike_name"]
            default:
            break
        }
    }
}

// DO
let jsonData = """
{ 
    "motobike_name": "Honda"
}
"""
try JSONDecoder().decode(Verhicle.self, 
                         from: jsonData.data(using: .utf8)!,
                         with: VehicleMappingContext.bike)
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
