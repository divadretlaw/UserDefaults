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

open class UserDefaults {

    fileprivate var userDefaults : Foundation.UserDefaults?

    // MARK : init

    fileprivate init() {
        userDefaults = Foundation.UserDefaults.standard
    }

    init(defaults: Foundation.UserDefaults) {
        userDefaults = defaults
    }

    // MARK : UDKey key

    subscript(udkey: UDKey<Bool>) -> Bool {
        get { return self.bool(udkey.key) }
        set { self[udkey.key] = newValue as AnyObject? }
    }

    subscript(udkey: UDKey<Int>) -> Int {
        get { return self.integer(udkey.key) }
        set { self[udkey.key] = newValue as AnyObject? }
    }

    subscript(udkey: UDKey<Float>) -> Float {
        get { return self.float(udkey.key) }
        set { self[udkey.key] = newValue as AnyObject? }
    }

    subscript(udkey: UDKey<Double>) -> Double {
        get { return self.double(udkey.key) }
        set { self[udkey.key] = newValue as AnyObject? }
    }

    subscript(udkey: UDKey<[AnyObject]>) -> [AnyObject]? {
        get { return self.array(udkey.key) }
        set { self[udkey.key] = newValue as AnyObject? }
    }

    subscript(udkey: UDKey<Data>) -> Data? {
        get { return self.data(udkey.key) }
        set { self[udkey.key] = newValue as AnyObject? }
    }

    subscript(udkey: UDKey<Date>) -> Date? {
        get { return self.date(udkey.key) }
        set { self[udkey.key] = newValue as AnyObject? }
    }

    subscript(udkey: UDKey<[String : AnyObject]>) -> [String : AnyObject]? {
        get { return self.dictionary(udkey.key) }
        set { self[udkey.key] = newValue as AnyObject? }
    }

    subscript(udkey: UDKey<String>) -> String? {
        get { return self.string(udkey.key) }
        set { self[udkey.key] = newValue as AnyObject? }
    }

    subscript(udkey: UDKey<URL>) -> URL? {
        get { return self.url(udkey.key) }
        set { self[udkey.key] = newValue as AnyObject? }
    }

    // MARK: String key

    subscript(key: String) -> AnyObject? {
        set(value) {
            switch(value) {
            case
            is String,
            is NSString,
            is NSNumber,
            is Data,
            is Date,
            is URL,
            // Array
            is [String],
            is [NSString],
            is [NSNumber],
            is [Data],
            is [Date],
            // Dictionary
            is [String: String],
            is [String: NSString],
            is [String: NSNumber],
            is [String: Data],
            is [String: Date],
            is [String: URL]:
                userDefaults?.set(value, forKey: key)
                userDefaults?.synchronize()
            default:
                assertionFailure("Invalid value type")
            }
        }
        get {
            return userDefaults?.object(forKey: key) as AnyObject?
        }
    }

    // MARK : Getting values associated with the specified key

    /**
     * Returns the array associated with the specified key
     */
    func array(_ key: String) -> [AnyObject]? {
        return userDefaults?.array(forKey: key) as [AnyObject]?
    }

    /**
     * Returns the array associated with the specified key
     */
    func arrayValue(_ key: String) -> [AnyObject] {
        return array(key) ?? []
    }

    /**
     * Returns the data object associated with the specified key
     */
    func data(_ key: String) -> Data? {
        return userDefaults?.data(forKey: key)
    }

    /**
     * Returns the data object associated with the specified key
     */
    func dataValue(_ key: String) -> Data {
        return data(key) ?? Data()
    }

    /**
     * Returns the NSDate instance associated with the specified key
     */
    func date(_ key: String) -> Date? {
        if let date = userDefaults?.object(forKey: key) as? Date {
            return date
        }
        return nil
    }

    /**
     * Returns the data object associated with the specified key
     */
    func dateValue(_ key: String) -> Date {
        return date(key) ?? Date()
    }

    /**
     * Returns the Boolean value associated with the specified key
     */
    func bool(_ key: String) -> Bool {
        if let ud = userDefaults {
            return ud.bool(forKey: key)
        }
        return false
    }

    /**
     * Returns the double value associated with the specified key
     */
    func double(_ key: String) -> Double {
        if let ud = userDefaults {
            return ud.double(forKey: key)
        }
        return 0.0
    }

    /**
     * Returns the float value associated with the specified key
     */
    func float(_ key: String) -> Float {
        if let ud = userDefaults {
            return ud.float(forKey: key)
        }
        return 0.0
    }

    /**
     * Returns the integer value associated with the specified key
     */
    func integer(_ key: String) -> Int {
        if let ud = userDefaults {
            return ud.integer(forKey: key)
        }
        return 0
    }

    /**
     * Returns the dictionary object associated with the specified key
     */
    func dictionary(_ key: String) -> [String : AnyObject]? {
        return userDefaults?.dictionary(forKey: key) as [String : AnyObject]?
    }

    /**
     * Returns the dictionary object associated with the specified key
     */
    func dictionaryValue(_ key: String) -> [String : AnyObject] {
        return dictionary(key) ?? [:]
    }

    /**
     * Returns the string associated with the specified key
     */
    func string(_ key: String) -> String? {
        return userDefaults?.string(forKey: key)
    }

    /**
     * Returns the string associated with the specified key
     */
    func stringValue(_ key: String) -> String {
        return string(key) ?? ""
    }

    /**
     * Returns the NSURL instance associated with the specified key
     */
    func url(_ key: String) -> URL? {
        return userDefaults?.url(forKey: key)
    }

    /**
     * Returns the NSURL instance associated with the specified key
     */
    func urlValue(_ key: String) -> URL {
        return self.url(key) ?? (NSURL() as URL)
    }

    // MARK : Clearing UserDefaults

    /**
     * Deletes the stored value associated with the specified key
     */
    func clear(_ key: String) {
        userDefaults?.removeObject(forKey: key)
    }

    /**
     * Deletes every stored value in the UserDefaults
     */
    func clearAll() {
        if let appDomain = Bundle.main.bundleIdentifier {
            userDefaults?.removePersistentDomain(forName: appDomain)
        }
    }
}

class UDKeys { fileprivate init() {} }

class UDKey<T> : UDKeys {
    let key : String
    init(_ key: String) {
        self.key = key
    }
}
