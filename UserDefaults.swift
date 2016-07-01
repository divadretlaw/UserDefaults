//
//  UserDefaults.swift
//
//  Copyright © 2015 David Walter (www.davidwalter.at)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import Foundation

// extension UDKeys {
//     // Declare any key you want to use here as a static key e.g.
//     static let key = UDKey<String>("Key")
// }

// Global Defaults

public let Defaults = UserDefaults()

public class UserDefaults {

    private var userDefaults : Foundation.UserDefaults?

    // MARK : init

    private init() {
        userDefaults = Foundation.UserDefaults.standard()
    }

    init(defaults: Foundation.UserDefaults) {
        userDefaults = defaults
    }

    // MARK : UDKey key

    subscript(udkey: UDKey<Bool>) -> Bool {
        get { return self.bool(key: udkey.key) }
        set { self[udkey.key] = newValue }
    }

    subscript(udkey: UDKey<Int>) -> Int {
        get { return self.integer(key: udkey.key) }
        set { self[udkey.key] = newValue }
    }

    subscript(udkey: UDKey<Float>) -> Float {
        get { return self.float(key: udkey.key) }
        set { self[udkey.key] = newValue }
    }

    subscript(udkey: UDKey<Double>) -> Double {
        get { return self.double(key: udkey.key) }
        set { self[udkey.key] = newValue }
    }

    subscript(udkey: UDKey<[AnyObject]>) -> [AnyObject]? {
        get { return self.array(key: udkey.key) }
        set { self[udkey.key] = newValue }
    }

    subscript(udkey: UDKey<NSData>) -> NSData? {
        get { return self.data(key: udkey.key) }
        set { self[udkey.key] = newValue }
    }

    subscript(udkey: UDKey<NSDate>) -> NSDate? {
        get { return self.date(key: udkey.key) }
        set { self[udkey.key] = newValue }
    }

    subscript(udkey: UDKey<[String : AnyObject]>) -> [String : AnyObject]? {
        get { return self.dictionary(key: udkey.key) }
        set { self[udkey.key] = newValue }
    }

    subscript(udkey: UDKey<String>) -> String? {
        get { return self.string(key: udkey.key) }
        set { self[udkey.key] = newValue }
    }

    subscript(udkey: UDKey<NSURL>) -> NSURL? {
        get { return self.url(key: udkey.key) }
        set { self[udkey.key] = newValue }
    }

    // MARK: String key

    subscript(key: String) -> AnyObject? {
        set(value) {
            switch(value) {
            case
            is String,
            is NSString,
            is NSNumber,
            is NSData,
            is NSDate,
            is NSURL,
            // Array
            is [String],
            is [NSString],
            is [NSNumber],
            is [NSData],
            is [NSDate],
            // Dictionary
            is [String: String],
            is [String: NSString],
            is [String: NSNumber],
            is [String: NSData],
            is [String: NSDate],
            is [String: NSURL]:
                userDefaults?.set(value, forKey: key)
                userDefaults?.synchronize()
            default:
                assertionFailure("Invalid value type")
            }
        }
        get {
            return userDefaults?.object(forKey: key)
        }
    }

    // MARK : Getting values associated with the specified key

    /**
     * Returns the array associated with the specified key
     */
    func array(key: String) -> [AnyObject]? {
        return userDefaults?.array(forKey: key)
    }

    /**
     * Returns the array associated with the specified key
     */
    func arrayValue(key: String) -> [AnyObject] {
        return array(key: key) ?? []
    }

    /**
     * Returns the data object associated with the specified key
     */
    func data(key: String) -> NSData? {
        return userDefaults?.data(forKey: key)
    }

    /**
     * Returns the data object associated with the specified key
     */
    func dataValue(key: String) -> NSData {
        return data(key: key) ?? NSData()
    }

    /**
     * Returns the NSDate instance associated with the specified key
     */
    func date(key: String) -> NSDate? {
        if let date = userDefaults?.object(forKey: key) as? NSDate {
            return date
        }
        return nil
    }

    /**
     * Returns the data object associated with the specified key
     */
    func dateValue(key: String) -> NSDate {
        return date(key: key) ?? NSDate()
    }

    /**
     * Returns the Boolean value associated with the specified key
     */
    func bool(key: String) -> Bool {
        if let ud = userDefaults {
            return ud.bool(forKey: key)
        }
        return false
    }

    /**
     * Returns the double value associated with the specified key
     */
    func double(key: String) -> Double {
        if let ud = userDefaults {
            return ud.double(forKey: key)
        }
        return 0.0
    }

    /**
     * Returns the float value associated with the specified key
     */
    func float(key: String) -> Float {
        if let ud = userDefaults {
            return ud.float(forKey: key)
        }
        return 0.0
    }

    /**
     * Returns the integer value associated with the specified key
     */
    func integer(key: String) -> Int {
        if let ud = userDefaults {
            return ud.integer(forKey: key)
        }
        return 0
    }

    /**
     * Returns the dictionary object associated with the specified key
     */
    func dictionary(key: String) -> [String : AnyObject]? {
        return userDefaults?.dictionary(forKey: key)
    }

    /**
     * Returns the dictionary object associated with the specified key
     */
    func dictionaryValue(key: String) -> [String : AnyObject] {
        return dictionary(key: key) ?? [:]
    }

    /**
     * Returns the string associated with the specified key
     */
    func string(key: String) -> String? {
        return userDefaults?.string(forKey: key)
    }

    /**
     * Returns the string associated with the specified key
     */
    func stringValue(key: String) -> String {
        return string(key: key) ?? ""
    }

    /**
     * Returns the NSURL instance associated with the specified key
     */
    func url(key: String) -> NSURL? {
        return userDefaults?.url(forKey: key)
    }

    /**
     * Returns the NSURL instance associated with the specified key
     */
    func urlValue(key: String) -> NSURL {
        return self.url(key: key) ?? NSURL()
    }

    // MARK : Clearing UserDefaults

    /**
     * Deletes the stored value associated with the specified key
     */
    func clear(key: String) {
        userDefaults?.removeObject(forKey: key)
    }

    /**
     * Deletes every stored value in the UserDefaults
     */
    func clearAll() {
        if let appDomain = Bundle.main().bundleIdentifier {
            userDefaults?.removePersistentDomain(forName: appDomain)
        }
    }
}

class UDKeys { private init() {} }

class UDKey<T> : UDKeys {
    let key : String
    init(_ key: String) {
        self.key = key
    }
}
