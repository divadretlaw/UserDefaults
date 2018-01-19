//
//  UserDefaultsTests.swift
//  UserDefaultsTests
//
//  Created by David Walter on 19.01.18.
//  Copyright © 2018 David Walter. All rights reserved.
//

import XCTest
import UserDefaults

extension UDKeys {
    static let bool = UDKey<Bool>("bool")
    static let int = UDKey<Int>("integer")
    static let float = UDKey<Float>("float")
    static let double = UDKey<Double>("double")
    static let string = UDKey<String>("string")
    static let data = UDKey<Data>("data")
    static let date = UDKey<Date>("date")
    static let url = UDKey<URL>("url")
    
    static let boolArray = UDKey<[Bool]>("boolArray")
    static let intArray = UDKey<[Int]>("intArray")
    static let floatArray = UDKey<[Float]>("floatArray")
    static let doubleArray = UDKey<[Double]>("doubleArray")
    static let stringArray = UDKey<[String]>("stringArray")
    static let dataArray = UDKey<[Data]>("dataArray")
    static let dateArray = UDKey<[Date]>("dateArray")
    static let urlArray = UDKey<[URL]>("urlArray")
    
    static let boolDictionary = UDKey<[String:Bool]>("boolDictionary")
    static let intDictionary = UDKey<[String:Int]>("intDictionary")
    static let floatDictionary = UDKey<[String:Float]>("floatDictionary")
    static let doubleDictionary = UDKey<[String:Double]>("doubleDictionary")
    static let stringDictionary = UDKey<[String:String]>("stringDictionary")
    static let dataDictionary = UDKey<[String:Data]>("dataDictionary")
    static let dateDictionary = UDKey<[String:Date]>("dateDictionary")
    static let urlDictionary = UDKey<[String:URL]>("urlDictionary")
}

class UserDefaultsTests: XCTestCase {
    
    var userDefaults: UserDefaults!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.userDefaults = UserDefaults.standard
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Single
    
    func testBool() {
        let value = true
        userDefaults[UDKeys.bool] = value
        assert(userDefaults[UDKeys.bool] == value)
    }
    
    func testInt() {
        let value = 42
        userDefaults[UDKeys.int] = value
        assert(userDefaults[UDKeys.int] == value)
    }
    
    func testFloat() {
        let value: Float = 42.0
        userDefaults[UDKeys.float] = value
        assert(userDefaults[UDKeys.float] == value)
    }
    
    func testDouble() {
        let value: Double = 42.0
        userDefaults[UDKeys.double] = value
        assert(userDefaults[UDKeys.double] == value)
    }
    
    func testString() {
        let value = "String"
        userDefaults[UDKeys.string] = value
        assert(userDefaults[UDKeys.string] == value)
    }
    
    func testData() {
        let value = Data(bytes: [1,0,1,0])
        userDefaults[UDKeys.data] = value
        assert(userDefaults[UDKeys.data] == value)
    }
    
    func testDate() {
        let value = Date()
        userDefaults[UDKeys.date] = value
        assert(userDefaults[UDKeys.date] == value)
    }

    func testURL() {
        let value = URL(string: "https://github.com/")!
        userDefaults[.url] = value
        assert(userDefaults[.url] == value)
    }
    
    // MARK: - Array
    
    func testBoolArray() {
        let value = [true, false]
        userDefaults[UDKeys.boolArray] = value
        assert(userDefaults[UDKeys.boolArray]! == value)
    }
    
    func testIntArray() {
        let value = [42, 11]
        userDefaults[UDKeys.intArray] = value
        assert(userDefaults[UDKeys.intArray]! == value)
    }
    
    func testFloatArray() {
        let value: [Float] = [42.0, 11.0]
        userDefaults[UDKeys.floatArray] = value
        assert(userDefaults[UDKeys.floatArray]! == value)
    }
    
    func testDoubleArray() {
        let value: [Double] = [42.0, 11.0]
        userDefaults[UDKeys.doubleArray] = value
        assert(userDefaults[UDKeys.doubleArray]! == value)
    }
    
    func testStringArray() {
        let value = ["String", "Array"]
        userDefaults[UDKeys.stringArray] = value
        assert(userDefaults[UDKeys.stringArray]! == value)
    }
    
    func testDataArray() {
        let value = [Data(bytes: [1,0,1,0]), Data(bytes: [0,1,0,1])]
        userDefaults[UDKeys.dataArray] = value
        assert(userDefaults[UDKeys.dataArray]! == value)
    }
    
    func testDateArray() {
        let value = [Date(), Date()]
        userDefaults[UDKeys.dateArray] = value
        assert(userDefaults[UDKeys.dateArray]! == value)
    }
    
    /*func testURLArray() {
        let value = [URL(string: "https://github.com/")!, URL(string: "https://example.com/")!]
        userDefaults[UDKeys.urlArray] = value
        assert(userDefaults[UDKeys.urlArray]! == value)
    }*/
    
    // MARK: - Dictionary
    
    func testBoolDictionary() {
        let value = ["key": true]
        userDefaults[UDKeys.boolDictionary] = value
        assert(userDefaults[UDKeys.boolDictionary]! == value)
    }
    
    func testIntDictionary() {
        let value = ["key": 42]
        userDefaults[UDKeys.intDictionary] = value
        assert(userDefaults[UDKeys.intDictionary]! == value)
    }
    
    func testFloatDictionary() {
        let value: [String: Float] = ["key": 42.0]
        userDefaults[UDKeys.floatDictionary] = value
        assert(userDefaults[UDKeys.floatDictionary]! == value)
    }
    
    func testDoubleDictionary() {
        let value: [String: Double] = ["key": 42.0]
        userDefaults[UDKeys.doubleDictionary] = value
        assert(userDefaults[UDKeys.doubleDictionary]! == value)
    }
    
    func testStringDictionary() {
        let value = ["key": "String"]
        userDefaults[UDKeys.stringDictionary] = value
        assert(userDefaults[UDKeys.stringDictionary]! == value)
    }
    
    func testDataDictionary() {
        let value = ["key": Data(bytes: [1,0,1,0])]
        userDefaults[UDKeys.dataDictionary] = value
        assert(userDefaults[UDKeys.dataDictionary]! == value)
    }
    
    func testDateDictionary() {
        let value = ["key": Date()]
        userDefaults[UDKeys.dateDictionary] = value
        assert(userDefaults[UDKeys.dateDictionary]! == value)
    }
    
    /*func testURLDictionary() {
        let value = ["key": URL(string: "https://github.com/")!]
        userDefaults[UDKeys.urlDictionary] = value
        assert(userDefaults[UDKeys.urlDictionary]! == value)
    }*/
}
