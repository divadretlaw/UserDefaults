//
//  UserDefaults.swift
//
//  Copyright © 2018 David Walter (www.davidwalter.at)
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

public extension UserDefaults {

    // MARK: - subscripts
 
    public subscript(udkey: DefaultsKey<Bool>) -> Bool {
        get { return value(udkey) }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: DefaultsKey<Int>) -> Int {
        get { return value(udkey) }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: DefaultsKey<Float>) -> Float {
        get { return value(udkey) }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: DefaultsKey<Double>) -> Double {
        get { return value(udkey) }
        set { self[udkey.key] = newValue }
    }
    
    public subscript<T>(udkey: DefaultsKey<T>) -> T? {
        get { return value(udkey) }
        set { self[udkey.key] = newValue }
    }
    
    // MARK: - URL workarounds
    
    public subscript(udkey: DefaultsKey<URL>) -> URL? {
        get { return url(forKey: udkey.key) }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: DefaultsKey<[URL]>) -> [URL]? {
        get {
            guard let urls = array(forKey: udkey.key) as? [String] else { return nil }
            return urls.map { URL(string: $0) ?? NSURL() as URL }
        }
        set {
            self[udkey.key] = newValue
        }
    }
    
    public subscript(udkey: DefaultsKey<[String : URL]>) -> [String : URL]? {
        get {
            guard let urls = dictionary(forKey: udkey.key) as? [String : String] else { return nil }
            var urlDict = [String:URL]()
            for url in urls {
                urlDict[url.key] = URL(string: url.value) ?? NSURL() as URL
            }
            return urlDict
        }
        set {
            self[udkey.key] = newValue
        }
    }
    
    // MARK: - String subscript

    public subscript(key: String) -> Any? {
        set(value) {
            guard let value = value else {
                removeObject(forKey: key)
                return
            }
            switch value {
            case
            is String,
            is NSNumber,
            is Data,
            is Date,
            // Array
            is [String],
            is [NSNumber],
            is [Data],
            is [Date],
            // Dictionary
            is [String: String],
            is [String: NSNumber],
            is [String: Data],
            is [String: Date]:
                set(value, forKey: key)
            case is URL:
                set(value as? URL, forKey: key)
            case is [URL]:
                guard let urls = value as? [URL] else {
                    assertionFailure("Invalid URL array")
                    return
                }
                self[key] = urls.map { $0.absoluteString }
            case is [String: URL]:
                guard let urls = value as? [String: URL] else {
                    assertionFailure("Invalid URL dictionary")
                    return
                }
                var urlDict = [String:String]()
                for url in urls {
                    urlDict[url.key] = url.value.absoluteString
                }
                self[key] = urlDict
            default:
                assertionFailure("Invalid value type")
            }
        }
        get {
            return object(forKey: key)
        }
    }
    
    // MARK: - Getting values associated with the specified UDKey
    
    private func value(_ key: DefaultsKey<Bool>) -> Bool {
        return bool(forKey: key.key)
    }
    
    private func value(_ key: DefaultsKey<Int>) -> Int {
        return integer(forKey: key.key)
    }
    
    private func value(_ key: DefaultsKey<Float>) -> Float {
        return float(forKey: key.key)
    }
    
    private func value(_ key: DefaultsKey<Double>) -> Double {
        return double(forKey: key.key)
    }
    
    private func value<T>(_ key: DefaultsKey<T>) -> T? {
        return object(forKey: key.key) as? T
    }
    
    // MARK : Clearing UserDefaults

    /**
     * Deletes the stored value associated with the specified key
     */
    public func clear(_ key: String) {
        removeObject(forKey: key)
    }
    
    /**
     * Deletes every stored value in the UserDefaults
     */
    public func clearAll() {
        if let appDomain = Bundle.main.bundleIdentifier {
            removePersistentDomain(forName: appDomain)
        }
    }
}

public class DefaultsKeys { fileprivate init() {} }

public class DefaultsKey<T> : DefaultsKeys {
    public let key : String
    public init(_ key: String) {
        self.key = key
    }
}
