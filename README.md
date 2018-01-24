# UserDefaults

[![Build Status](https://travis-ci.org/divadretlaw/UserDefaults.svg?style=flat)](https://travis-ci.org/divadretlaw/UserDefaults)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%20|%20macOS%20|%20watchOS%20|%20tvOS-blue.svg?style=flat)](https://github.com/divadretlaw/UserDefaults)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://swift.org)

## Usage

Define Static Keys for easy access to data stored in UserDefaults

```swift
extension DefaultsKeys {
  static let key = DefaultsKey<String>("key")
  static let number = DefaultsKey<Double>("number")
  static let condition = DefaultsKey<Bool>("condition")
}
```

### Write to UserDefaults

Static keys

```swift
UserDefaults.standard[.key] = "Value"
UserDefaults.standard[.number] = -3.4
UserDefaults.standard[.condition] = true
```

String Keys

```swift
UserDefaults.standard["key"] = "Value"
UserDefaults.standard["number"] = -3.4
UserDefaults.standard["condition"] = true
```

### Read from UserDefaults

Static Keys

```swift
var string = UserDefaults.standard[.key]
// string = Optional(Value)

if (UserDefaults.standard[.condition]) {
  // true
}
```

String Keys

```swift
let object = UserDefaults.standard["key"]
// object = Optional(Value)

let string = UserDefaults.standard.string("key")
// string = Optional("Value")

let string = UserDefaults.standard.stringValue("key")
// string = "Value"
```

### Alter UserDefaults

Static Keys

```swift
UserDefaults.standard[.key] += ". Other value."

UserDefaults.standard[.number] *= 1.2
```

String Keys

```swift
UserDefaults.standard["key"] = UserDefaults.standard.stringValue("key") + ". Other value."

UserDefaults.standard["number"] = UserDefaults.standard.double("number") * 1.2
```

## Installation

UserDefaults is available through [Carthage](https://github.com/Carthage/Carthage). To install just write into your Cartfile:
 
```
github "divadretlaw/UserDefaults"
```


## License

See [LICENSE](LICENSE)

Copyright © 2018 David Walter \(www.davidwalter.at)
