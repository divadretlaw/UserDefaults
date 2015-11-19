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

let Defaults = UserDefaults()

class UserDefaults {

    private var userDefaults : NSUserDefaults?

    // MARK : init

    private init() {
        userDefaults = NSUserDefaults.standardUserDefaults()
    }

    init(defaults: NSUserDefaults) {
        userDefaults = defaults
    }

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
                userDefaults?.setObject(value, forKey: key)
                userDefaults?.synchronize()
            default:
                assertionFailure("Invalid value type")
            }
        }
        get {
            return userDefaults?.objectForKey(key)
        }
    }

    // MARK : Getting values associated with the specified key

    /**
     * Returns the array associated with the specified key
     */
    func array(key: String) -> [AnyObject]? {
        return userDefaults?.arrayForKey(key)
    }

    /**
     * Returns the array associated with the specified key
     */
    func arrayValue(key: String) -> [AnyObject] {
        return array(key) ?? []
    }

    /**
     * Returns the data object associated with the specified key
     */
    func data(key: String) -> NSData? {
        return userDefaults?.dataForKey(key)
    }

    /**
     * Returns the data object associated with the specified key
     */
    func dataValue(key: String) -> NSData {
        return data(key) ?? NSData()
    }

    /**
     * Returns the NSDate instance associated with the specified key
     */
    func date(key: String) -> NSDate? {
        if let date = userDefaults?.objectForKey(key) as? NSDate {
            return date
        }
        return nil
    }

    /**
     * Returns the data object associated with the specified key
     */
    func dateValue(key: String) -> NSDate {
        return date(key) ?? NSDate()
    }

    /**
     * Returns the Boolean value associated with the specified key
     */
    func bool(key: String) -> Bool {
        if let ud = userDefaults {
            return ud.boolForKey(key)
        }
        return false
    }

    /**
     * Returns the double value associated with the specified key
     */
    func double(key: String) -> Double {
        if let ud = userDefaults {
            return ud.doubleForKey(key)
        }
        return 0.0
    }

    /**
     * Returns the float value associated with the specified key
     */
    func float(key: String) -> Float {
        if let ud = userDefaults {
            return ud.floatForKey(key)
        }
        return 0.0
    }

    /**
     * Returns the integer value associated with the specified key
     */
    func integer(key: String) -> Int {
        if let ud = userDefaults {
            return ud.integerForKey(key)
        }
        return 0
    }

    /**
     * Returns the dictionary object associated with the specified key
     */
    func dictionary(key: String) -> [String : AnyObject]? {
        return userDefaults?.dictionaryForKey(key)
    }

    /**
     * Returns the dictionary object associated with the specified key
     */
    func dictionaryValue(key: String) -> [String : AnyObject] {
        return dictionary(key) ?? [:]
    }

    /**
     * Returns the string associated with the specified key
     */
    func string(key: String) -> String? {
        return userDefaults?.stringForKey(key)
    }

    /**
     * Returns the string associated with the specified key
     */
    func stringValue(key: String) -> String {
        return string(key) ?? ""
    }

    /**
     * Returns the NSURL instance associated with the specified key
     */
    func url(key: String) -> NSURL? {
        return userDefaults?.URLForKey(key)
    }

    /**
     * Returns the NSURL instance associated with the specified key
     */
    func urlValue(key: String) -> NSURL {
        return self.url(key) ?? NSURL()
    }

    // MARK : Clearing UserDefaults

    /**
    * Deletes the stored value associated with the specified key
    */
    func clear(key: String) {
        userDefaults?.removeObjectForKey(key)
    }

    /**
     * Deletes every stored value in the UserDefaults
     */
    func clearAll() {
        if let appDomain = NSBundle.mainBundle().bundleIdentifier {
            userDefaults?.removePersistentDomainForName(appDomain)
        }
    }
}
