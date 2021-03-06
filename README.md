![framework](https://user-images.githubusercontent.com/6899256/35834740-56972364-0ad7-11e8-9374-0f7d523b2367.png)

# UserDefaults [![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat-square)](https://github.com/Carthage/Carthage) [![Swift](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat-square)](https://swift.org) [![License](https://img.shields.io/github/license/divadretlaw/userdefaults.svg?style=flat-square)](LICENSE)

[![Platforms](https://img.shields.io/badge/Platforms-iOS%20|%20macOS%20|%20watchOS%20|%20tvOS-blue.svg?style=flat-square)](https://github.com/divadretlaw/UserDefaults)


### Build Status

|iOS|macOS|watchOS|tvOS|
|:-:|:-:|:-:|:-:|
|[![](https://travis-matrix-badges.herokuapp.com/repos/divadretlaw/UserDefaults/branches/master/2)](https://travis-ci.org/divadretlaw/UserDefaults)|[![](https://travis-matrix-badges.herokuapp.com/repos/divadretlaw/UserDefaults/branches/master/1)](https://travis-ci.org/divadretlaw/UserDefaults)|[![](https://travis-matrix-badges.herokuapp.com/repos/divadretlaw/UserDefaults/branches/master/3)](https://travis-ci.org/divadretlaw/UserDefaults)|[![](https://travis-matrix-badges.herokuapp.com/repos/divadretlaw/UserDefaults/branches/master/4)](https://travis-ci.org/divadretlaw/UserDefaults)|

## Usage

Define Static Keys for easy access to data stored in UserDefaults

```swift
extension DefaultsKeys {
  static let key = DefaultsKey<String>("key")
  static let number = DefaultsKey<Double>("number")
  static let condition = DefaultsKey<Bool>("condition")
  // eg. struct SomeCodable : Codeable { ... }
  static let codeable = DefaultsKey<SomeCodable>("somecodeable")
}
```

### Write to UserDefaults

Static keys

```swift
UserDefaults.standard[.key] = "Value"
UserDefaults.standard[.number] = -3.4
UserDefaults.standard[.condition] = true
UserDefaults.standard[.codeable] = SomeCodable()
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
// string = Optional<String>

if UserDefaults.standard[.condition] {
  // true
}

let someCodable: SomeCodable? = UserDefaults.standard[.codeable]
// someCodable = Optional<SomeCodable>
```

String Keys

```swift
let object = UserDefaults.standard["key"]
// object = Optional<Any>

let string = UserDefaults.standard.string("key")
// string = Optional<String>
```

### Alter UserDefaults

Static Keys

```swift
UserDefaults.standard[.key] += ". Other value."

UserDefaults.standard[.number] *= 1.2
```

String Keys

```swift
UserDefaults.standard["key"] = UserDefaults.standard.string(forKey: "key") ?? "" + ". Other value."

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
