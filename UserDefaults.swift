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

#if os(iOS)
    
    import UIKit
    
#elseif os(OSX)
    
    import AppKit
    
#endif

class UserDefaults {
    
    var userDefaults : NSUserDefaults?
    
    // MARK : init
    
    init() {
        userDefaults = NSUserDefaults.standardUserDefaults()
    }
    
    init(defaults: NSUserDefaults) {
        userDefaults = defaults
    }
    
    subscript(key: String) -> AnyObject? {
        set(value) {
            switch(value) {
            case is Array<AnyObject>,
            is NSData,
            is Dictionary<String, AnyObject>,
            is Bool,
            is Double,
            is Float,
            is Int,
            is String,
            is NSURL:
                userDefaults?.setObject(value, forKey: key)
                userDefaults?.synchronize()
            default:
                break
            }
        }
        get {
            return userDefaults?.objectForKey(key)
        }
    }
    
    // MARK : Getting values associated with the specified key
    
    func array(key: String) -> [AnyObject]? {
        return userDefaults?.arrayForKey(key)
    }
    
    /**
     * Returns the data object associated with the specified key
     */
    func data(key: String) -> NSData? {
        return userDefaults?.dataForKey(key)
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
     * Returns the string associated with the specified key
     */
    func string(key: String) -> String? {
        return userDefaults?.stringForKey(key)
    }
    
    /**
     * Returns the NSURL instance associated with the specified key
     */
    func url(key: String) -> NSURL? {
        return userDefaults?.URLForKey(key)
    }
    
    // MARK : Clearing UserDefaults
    
    /**
    * Deletes the stored value associated with the specified key
    */
    func clear(key: String) {
        userDefaults?.removeObjectForKey(key)
        userDefaults?.synchronize()
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