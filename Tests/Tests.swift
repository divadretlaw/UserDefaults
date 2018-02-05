//
//  UserDefaultsTests.swift
//  UserDefaultsTests
//
//  Created by David Walter on 19.01.18.
//  Copyright © 2018 David Walter. All rights reserved.
//

import XCTest
import UserDefaults

extension DefaultsKeys {
    static let bool = DefaultsKey<Bool>("bool")
    static let int = DefaultsKey<Int>("integer")
    static let float = DefaultsKey<Float>("float")
    static let double = DefaultsKey<Double>("double")
    static let string = DefaultsKey<String>("string")
    static let data = DefaultsKey<Data>("data")
    static let date = DefaultsKey<Date>("date")
    static let url = DefaultsKey<URL>("url")
    
    static let boolArray = DefaultsKey<[Bool]>("boolArray")
    static let intArray = DefaultsKey<[Int]>("intArray")
    static let floatArray = DefaultsKey<[Float]>("floatArray")
    static let doubleArray = DefaultsKey<[Double]>("doubleArray")
    static let stringArray = DefaultsKey<[String]>("stringArray")
    static let dataArray = DefaultsKey<[Data]>("dataArray")
    static let dateArray = DefaultsKey<[Date]>("dateArray")
    static let urlArray = DefaultsKey<[URL]>("urlArray")
    
    static let boolDictionary = DefaultsKey<[String:Bool]>("boolDictionary")
    static let intDictionary = DefaultsKey<[String:Int]>("intDictionary")
    static let floatDictionary = DefaultsKey<[String:Float]>("floatDictionary")
    static let doubleDictionary = DefaultsKey<[String:Double]>("doubleDictionary")
    static let stringDictionary = DefaultsKey<[String:String]>("stringDictionary")
    static let dataDictionary = DefaultsKey<[String:Data]>("dataDictionary")
    static let dateDictionary = DefaultsKey<[String:Date]>("dateDictionary")
    static let urlDictionary = DefaultsKey<[String:URL]>("urlDictionary")
}

class UserDefaultsTests: XCTestCase {
    
    var userDefaults: UserDefaults!
    
    override func setUp() {
        super.setUp()
        self.userDefaults = UserDefaults.standard
    }
    
    override func tearDown() {
        super.tearDown()
        self.userDefaults.clearAll()
    }
    
    // MARK: - Single
    
    func testBool() {
        let value = true
        userDefaults[.bool] = value
        assert(userDefaults[.bool] == value)
        
        userDefaults[.bool] = nil
        assert(userDefaults[.bool] == nil)
    }
    
    func testInt() {
        let value = 42
        userDefaults[.int] = value
        assert(userDefaults[.int] == value)
        
        userDefaults[.int] = nil
        assert(userDefaults[.int] == nil)
    }
    
    func testFloat() {
        let value: Float = 42.0
        userDefaults[.float] = value
        assert(userDefaults[.float] == value)
        
        userDefaults[.float] = nil
        assert(userDefaults[.float] == nil)
    }
    
    func testDouble() {
        let value: Double = 42.0
        userDefaults[.double] = value
        assert(userDefaults[.double] == value)
        
        userDefaults[.double] = nil
        assert(userDefaults[.double] == nil)
    }
    
    func testString() {
        let value = "String"
        userDefaults[.string] = value
        assert(userDefaults[.string] == value)
        
        userDefaults[.string] = nil
        assert(userDefaults[.string] == nil)
    }
    
    func testData() {
        let value = Data(bytes: [1,0,1,0])
        userDefaults[.data] = value
        assert(userDefaults[.data] == value)
        
        userDefaults[.data] = nil
        assert(userDefaults[.data] == nil)
    }
    
    func testDate() {
        let value = Date()
        userDefaults[.date] = value
        assert(userDefaults[.date] == value)
        
        userDefaults[.date] = nil
        assert(userDefaults[.date] == nil)
    }

    func testURL() {
        let value = URL(string: "https://github.com/")!
        userDefaults[.url] = value
        assert(userDefaults[.url] == value)
        
        userDefaults[.url] = nil
        assert(userDefaults[.url] == nil)
    }
    
    // MARK: - Array
    
    func testBoolArray() {
        let value = [true, false]
        userDefaults[.boolArray] = value
        assert(userDefaults[.boolArray]! == value)
    }
    
    func testIntArray() {
        let value = [42, 11]
        userDefaults[.intArray] = value
        assert(userDefaults[.intArray]! == value)
    }
    
    func testFloatArray() {
        let value: [Float] = [42.0, 11.0]
        userDefaults[.floatArray] = value
        assert(userDefaults[.floatArray]! == value)
    }
    
    func testDoubleArray() {
        let value: [Double] = [42.0, 11.0]
        userDefaults[.doubleArray] = value
        assert(userDefaults[.doubleArray]! == value)
    }
    
    func testStringArray() {
        let value = ["String", "Array"]
        userDefaults[.stringArray] = value
        assert(userDefaults[.stringArray]! == value)
    }
    
    func testDataArray() {
        let value = [Data(bytes: [1,0,1,0]), Data(bytes: [0,1,0,1])]
        userDefaults[.dataArray] = value
        assert(userDefaults[.dataArray]! == value)
    }
    
    func testDateArray() {
        let value = [Date(), Date()]
        userDefaults[.dateArray] = value
        assert(userDefaults[.dateArray]! == value)
    }
    
    func testURLArray() {
        let value = [URL(string: "https://github.com/")!, URL(string: "https://example.com/")!]
        userDefaults[.urlArray] = value
        assert(userDefaults[.urlArray]! == value)
    }
    
    // MARK: - Dictionary
    
    func testBoolDictionary() {
        let value = ["key": true]
        userDefaults[.boolDictionary] = value
        assert(userDefaults[.boolDictionary]! == value)
    }
    
    func testIntDictionary() {
        let value = ["key": 42]
        userDefaults[.intDictionary] = value
        assert(userDefaults[.intDictionary]! == value)
    }
    
    func testFloatDictionary() {
        let value: [String: Float] = ["key": 42.0]
        userDefaults[.floatDictionary] = value
        assert(userDefaults[.floatDictionary]! == value)
    }
    
    func testDoubleDictionary() {
        let value: [String: Double] = ["key": 42.0]
        userDefaults[.doubleDictionary] = value
        assert(userDefaults[.doubleDictionary]! == value)
    }
    
    func testStringDictionary() {
        let value = ["key": "String"]
        userDefaults[.stringDictionary] = value
        assert(userDefaults[.stringDictionary]! == value)
    }
    
    func testDataDictionary() {
        let value = ["key": Data(bytes: [1,0,1,0])]
        userDefaults[.dataDictionary] = value
        assert(userDefaults[.dataDictionary]! == value)
    }
    
    func testDateDictionary() {
        let value = ["key": Date()]
        userDefaults[.dateDictionary] = value
        assert(userDefaults[.dateDictionary]! == value)
    }
    
    func testURLDictionary() {
        let value = ["key": URL(string: "https://github.com/")!]
        userDefaults[.urlDictionary] = value
        assert(userDefaults[.urlDictionary]! == value)
    }
}
