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

    class func set(array: NSArray?, key: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(array, forKey: key)
        userDefaults.synchronize()
    }

    class func set(data: NSData?, key: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(data, forKey: key)
        userDefaults.synchronize()
    }

    class func set(dictionary: NSDictionary?, key: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(dictionary, forKey: key)
        userDefaults.synchronize()
    }

    /**
     * Also accepts an integer, float, double or Boolean value
     */
    class func set(number: NSNumber?, key: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(number, forKey: key)
        userDefaults.synchronize()
    }

    class func set(string: String?, key: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(string, forKey: key)
        userDefaults.synchronize()
    }

    class func set(url: NSURL?, key: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(url, forKey: key)
        userDefaults.synchronize()
    }

    /**
     * Returns the array associated with the specified key
     */
    class func array(key: String) -> NSArray? {
        return NSUserDefaults.standardUserDefaults().arrayForKey(key)
    }

    /**
     * Returns the data object associated with the specified key
     */
    class func data(key: String) -> NSData? {
        return NSUserDefaults.standardUserDefaults().dataForKey(key)
    }

    //NSNumber types

    /**
     * Returns the Boolean value associated with the specified key
     */
    class func bool(key: String) -> Bool {
        return NSUserDefaults.standardUserDefaults().boolForKey(key)
    }

    /**
     * Returns the double value associated with the specified key
     */
    class func double(key: String) -> Double {
        return NSUserDefaults.standardUserDefaults().doubleForKey(key)
    }

    /**
     * Returns the float value associated with the specified key
     */
    class func float(key: String) -> Float {
        return NSUserDefaults.standardUserDefaults().floatForKey(key)
    }

    /**
     * Returns the integer value associated with the specified key
     */
    class func integer(key: String) -> Int {
        return NSUserDefaults.standardUserDefaults().integerForKey(key)
    }

    //NSNumber types

    /**
     * Returns the dictionary object associated with the specified key
     */
    class func dictionary(key: String) -> NSDictionary? {
        return NSUserDefaults.standardUserDefaults().dictionaryForKey(key)
    }

    /**
     * Returns the string associated with the specified key
     */
    class func string(key: String) -> String? {
        return NSUserDefaults.standardUserDefaults().stringForKey(key)
    }

    /**
     * Returns the NSURL instance associated with the specified key
     */
    class func url(key: String) -> NSURL? {
        return NSUserDefaults.standardUserDefaults().URLForKey(key)
    }


    /**
     * Deletes the stored value associated with the specified key
     */
    class func clear(key: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey(key)
        userDefaults.synchronize()
    }

    /**
     * Deletes every stored value in the UserDefaults
     */
    class func clearAll() {
        if let appDomain = NSBundle.mainBundle().bundleIdentifier {
            NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain)
        }
    }

}
