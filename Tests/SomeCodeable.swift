//
//  SomeCodeable.swift
//  UserDefaults
//
//  Created by David Walter on 10.06.18.
//  Copyright © 2018 David Walter. All rights reserved.
//

import Foundation

public struct SomeCodeable: Codable, Equatable {
	
	static let json = """
{
	"string": "StringValue",
	"integer": 42
}
"""
	
	let string: String
	let integer: Int
}
