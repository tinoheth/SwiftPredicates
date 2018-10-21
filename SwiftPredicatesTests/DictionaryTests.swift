//
//  SwiftPredicatesTests.swift
//  SwiftPredicatesTests
//
//  Created by Tino Heth on 10.01.15.
//  Copyright (c) 2015 Tino Heth. All rights reserved.
//

import XCTest

class DictionaryTests: XCTestCase {
	
	let intArray: NSArray = [
		["value":0, "name":"Paris"],
		["value":1, "name":"Rome"],
		["value":-1, "name":"Rome", "comment":"target"],
		["value":55]
	]

	func testLess() {
		let predicate = "value" < 0
		let result = intArray.filtered(using: predicate)
		XCTAssert(result.count == 1, "Wrong result filtering <")
	}
	
	func testMoreOrEqual() {
		let predicate = "value" >= 0
		let result = intArray.filtered(using: predicate)
		XCTAssert(result.count == 3, "Wrong result filtering <")
	}
	
	func testLessAndEqual() {
		let a = "value" < 0
		let b = NSComparisonPredicate.propertyEqual(key: "name", "Rome")
		let predicate: NSCompoundPredicate = a && b
		let result = intArray.filtered(using: predicate)
		XCTAssert(result.count == 1, "Wrong result filtering < and ==")
	}
	
	func testLessAndEqualCombined() {
		let predicate = "value" < 0 && "name" == "Rome"
		let result = intArray.filtered(using: predicate)
		XCTAssert(result.count == 1, "Wrong result filtering < and ==")
		let selection = result.last as? NSDictionary
		let value = selection?["comment"] as? CustomStringConvertible
		XCTAssert(value?.description == "target")
	}
}
