# UserDefaults

Static Keys

```swift
extension UDKeys {
  static let Key = UDKey<String>("Key")
  static let Number = UDKey<Double>("Number")
  static let Condition = UDKey<Bool>("Condition")
}
```

#### Write to UserDefaults

Static keys

```swift
UserDefaults.standard[.Key] = "Value"
UserDefaults.standard[.Number] = -3.4
UserDefaults.standard[.Condition] = true
```

String Keys

```swift
UserDefaults.standard["Key"] = "Value"
UserDefaults.standard["Number"] = -3.4
UserDefaults.standard["Condition"] = true
```

#### Read from UserDefaults

Static Keys

```swift
var string = UserDefaults.standard[.Key]
// string = Optional(Value)

if (UserDefaults.standard[.Condition]) {
  // true
}
```

String Keys

```swift
let object = UserDefaults.standard["Key"]
// object = Optional(Value)

let string = UserDefaults.standard.string("Key")
// string = Optional("Value")

let string = UserDefaults.standard.stringValue("Key")
// string = "Value"
```

#### Alter UserDefaults

Static Keys

```swift
UserDefaults.standard[.Key] += ". Other value."

UserDefaults.standard[.Number] *= 1.2
```

String Keys

```swift
UserDefaults.standard["Key"] = UserDefaults.standard.stringValue("Key") + ". Other value."

UserDefaults.standard["Number"] = UserDefaults.standard.double("Number") * 1.2
```

## License

Copyright © 2017 David Walter \(www.davidwalter.at)

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
