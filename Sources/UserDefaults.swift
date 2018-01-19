//
//  UserDefaults.swift
//
//  Copyright © 2017 David Walter (www.davidwalter.at)
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

    // MARK: - subscripts Single

    public subscript(udkey: UDKey<Bool>) -> Bool {
        get { return self.bool(udkey.key) }
        set { self[udkey.key] = newValue }
    }

    public subscript(udkey: UDKey<Int>) -> Int {
        get { return self.integer(udkey.key) }
        set { self[udkey.key] = newValue }
    }

    public subscript(udkey: UDKey<Float>) -> Float {
        get { return self.float(udkey.key) }
        set { self[udkey.key] = newValue }
    }

    public subscript(udkey: UDKey<Double>) -> Double {
        get { return self.double(udkey.key) }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<String>) -> String? {
        get { return self.string(udkey.key) }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<Data>) -> Data? {
        get { return self.data(udkey.key) }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<Date>) -> Date? {
        get { return self.date(udkey.key) }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<URL>) -> URL? {
        get { return self.url(udkey.key) }
        set { self[udkey.key] = newValue }
    }
    
    // MARK: - subscripts Array
    
    public subscript(udkey: UDKey<[Any]>) -> [Any]? {
        get { return self.array(udkey.key) }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[Bool]>) -> [Bool]? {
        get { return self.array(udkey.key) as? [Bool] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[Int]>) -> [Int]? {
        get { return self.array(udkey.key) as? [Int] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[Float]>) -> [Float]? {
        get { return self.array(udkey.key) as? [Float] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[Double]>) -> [Double]? {
        get { return self.array(udkey.key) as? [Double] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[String]>) -> [String]? {
        get { return self.array(udkey.key) as? [String] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[Data]>) -> [Data]? {
        get { return self.array(udkey.key) as? [Data] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[Date]>) -> [Date]? {
        get { return self.array(udkey.key) as? [Date] }
        set { self[udkey.key] = newValue }
    }
    
    /*public subscript(udkey: UDKey<[URL]>) -> [URL]? {
        get { return self.array(udkey.key) as? [URL] }
        set { self[udkey.key] = newValue }
    }*/
    
    // MARK: - subscript Dictionary
    
    public subscript(udkey: UDKey<[String : Any]>) -> [String : Any]? {
        get { return self.dictionary(udkey.key) }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[String : Bool]>) -> [String : Bool]? {
        get { return self.dictionary(udkey.key) as? [String : Bool] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[String : Int]>) -> [String : Int]? {
        get { return self.dictionary(udkey.key) as? [String : Int] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[String : Float]>) -> [String : Float]? {
        get { return self.dictionary(udkey.key) as? [String : Float] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[String : Double]>) -> [String : Double]? {
        get { return self.dictionary(udkey.key) as? [String : Double] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[String : String]>) -> [String : String]? {
        get { return self.dictionary(udkey.key) as? [String : String] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[String : Data]>) -> [String : Data]? {
        get { return self.dictionary(udkey.key) as? [String : Data] }
        set { self[udkey.key] = newValue }
    }
    
    public subscript(udkey: UDKey<[String : Date]>) -> [String : Date]? {
        get { return self.dictionary(udkey.key) as? [String : Date] }
        set { self[udkey.key] = newValue }
    }
    
    // MARK: - String subscripts

    public subscript(key: String) -> Any? {
        set(value) {
            switch(value) {
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
                self.set(value, forKey: key)
            case is URL:
                self.set(value as? URL, forKey: key)
            default:
                assertionFailure("Invalid value type")
            }
        }
        get {
            return self.object(forKey: key)
        }
    }
    
    // MARK: Getting values associated with the specified UDKey
    
    /**
     * Returns the array associated with the specified key
     */
    public func value(_ key: UDKey<[Any]>) -> [Any] {
        return self[key] ?? []
    }
    
    /**
     * Returns the data object associated with the specified key
     */
    public func value(_ key: UDKey<Data>) -> Data {
        return self[key] ?? Data()
    }
    
    /**
     * Returns the data object associated with the specified key
     */
    public func value(_ key: UDKey<Date>) -> Date {
        return self[key] ?? Date()
    }
    
    /**
     * Returns the Boolean value associated with the specified key
     */
    public func value(_ key: UDKey<Bool>) -> Bool {
        return self[key]
    }
    
    /**
     * Returns the double value associated with the specified key
     */
    public func value(_ key: UDKey<Double>) -> Double {
        return self[key]
    }
    
    /**
     * Returns the float value associated with the specified key
     */
    public func value(_ key: UDKey<Float>) -> Float {
        return self[key]
    }
    
    /**
     * Returns the integer value associated with the specified key
     */
    public func value(_ key: UDKey<Int>) -> Int {
        return self[key]
    }
    
    /**
     * Returns the dictionary object associated with the specified key
     */
    public func value(_ key: UDKey<[String : Any]>) -> [String : Any] {
        return self[key] ?? [:]
    }
    /**
     * Returns the string associated with the specified key
     */
    public func value(_ key: UDKey<String>) -> String {
        return self[key] ?? ""
    }
    
    /**
     * Returns the NSURL instance associated with the specified key
     */
    func value(_ key: UDKey<URL>) -> URL {
        return self[key] ?? (NSURL() as URL)
    }

    // MARK : Getting values associated with the specified key

    /**
     * Returns the array associated with the specified key
     */
    public func array(_ key: String) -> [Any]? {
        return self.array(forKey: key) as [Any]?
    }
    
    /**
     * Returns the array associated with the specified key
     */
    public func arrayValue(_ key: String) -> [Any] {
        return array(forKey: key) ?? []
    }

    /**
     * Returns the data object associated with the specified key
     */
    public func data(_ key: String) -> Data? {
        return self.data(forKey: key)
    }

    /**
     * Returns the data object associated with the specified key
     */
    public func dataValue(_ key: String) -> Data {
        return data(key) ?? Data()
    }

    /**
     * Returns the NSDate instance associated with the specified key
     */
    public func date(_ key: String) -> Date? {
        if let date = self.object(forKey: key) as? Date {
            return date
        }
        return nil
    }

    /**
     * Returns the data object associated with the specified key
     */
    public func dateValue(_ key: String) -> Date {
        return date(key) ?? Date()
    }

    /**
     * Returns the Boolean value associated with the specified key
     */
    public func bool(_ key: String) -> Bool {
        return self.bool(forKey: key)
    }

    /**
     * Returns the double value associated with the specified key
     */
    public func double(_ key: String) -> Double {
        return self.double(forKey: key)
    }

    /**
     * Returns the float value associated with the specified key
     */
    public func float(_ key: String) -> Float {
        return self.float(forKey: key)
    }

    /**
     * Returns the integer value associated with the specified key
     */
    public func integer(_ key: String) -> Int {
        return self.integer(forKey: key)
    }

    /**
     * Returns the dictionary object associated with the specified key
     */
    public func dictionary(_ key: String) -> [String : Any]? {
        return self.dictionary(forKey: key) as [String : Any]?
    }

    /**
     * Returns the dictionary object associated with the specified key
     */
    public func dictionaryValue(_ key: String) -> [String : Any] {
        return dictionary(key) ?? [:]
    }

    /**
     * Returns the string associated with the specified key
     */
    public func string(_ key: String) -> String? {
        return self.string(forKey: key)
    }

    /**
     * Returns the string associated with the specified key
     */
    public func stringValue(_ key: String) -> String {
        return string(key) ?? ""
    }

    /**
     * Returns the NSURL instance associated with the specified key
     */
    public func url(_ key: String) -> URL? {
        return self.url(forKey: key)
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
    public func clear(_ key: String) {
        self.removeObject(forKey: key)
    }

    /**
     * Deletes every stored value in the UserDefaults
     */
    public func clearAll() {
        if let appDomain = Bundle.main.bundleIdentifier {
            self.removePersistentDomain(forName: appDomain)
        }
    }
}

public class UDKeys { fileprivate init() {} }

public class UDKey<T> : UDKeys {
    public let key : String
    public init(_ key: String) {
        self.key = key
    }
}
