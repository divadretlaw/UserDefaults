# UserDefaults

[![Build Status](https://travis-ci.org/divadretlaw/UserDefaults.svg?style=flat)](https://travis-ci.org/divadretlaw/UserDefaults)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%20|%20macOS-blue.svg?style=flat)](https://github.com/divadretlaw/UserDefaults)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://swift.org)
## Usage

Define Static Keys for easy access to data stored in UserDefaults

```swift
extension UDKeys {
  static let key = UDKey<String>("key")
  static let number = UDKey<Double>("number")
  static let condition = UDKey<Bool>("condition")
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

Copyright © 2018 David Walter \(www.davidwalter.at)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
