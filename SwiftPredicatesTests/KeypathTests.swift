//
//  KeypathTests.swift
//  SwiftPredicates MacTests
//
//  Created by Tino Heth on 20.10.18.
//  Copyright © 2018 Tino Heth. All rights reserved.
//

import XCTest

class KeypathTests: XCTestCase {
	@objc class Dummy: NSObject {
		@objc let name: String
		@objc let value: Int
		@objc let comment: String
		@objc let numbers: [Int]

		init(name: String, value: Int, comment: String = "", numbers: [Int] = []) {
			self.name = name
			self.value = value
			self.comment = comment
			self.numbers = numbers
		}
	}

	let array: NSArray = [
		Dummy(name: "Rome", value: 42),
		Dummy(name: "Rome", value: -1, comment: "target"),
		Dummy(name: "Paris", value: 42),
		Dummy(name: "Amsterdam", value: 23),
		Dummy(name: "Amsterdam", value: -2),
		Dummy(name: "Panama", value: 444, numbers: [42, 23]),
	]

	func testLess() {
		let predicate = \Dummy.value < 0
		let result = array.filtered(using: predicate)
		XCTAssertEqual(result.count, 2, "Wrong result filtering <")
	}

	func testMoreOrEqual_string() {
		let predicate = "value" >= 0
		let result = array.filtered(using: predicate)
		XCTAssertEqual(result.count, 4, "Wrong result filtering <")
	}

	func testLessAndEqual() {
		let a = \Dummy.value < 0
		let b = NSComparisonPredicate.propertyEqual(key: "name", "Rome")
		let predicate: NSCompoundPredicate = a && b
		let result = array.filtered(using: predicate)
		XCTAssertEqual(result.count, 1, "Wrong result filtering < and ==")
	}

	func testLessAndEqualCombined() {
		let predicate = \Dummy.value < 0 && \Dummy.name == "Rome"
		let result = array.filtered(using: predicate)
		XCTAssert(result.count == 1, "Wrong result filtering < and ==")
		let selection = result.last as! Dummy
		XCTAssertEqual(selection.comment, "target")
	}

	func testContains_string() {
		let predicate = (\Dummy.name).contains("Am")
		let result = array.filtered(using: predicate)
		XCTAssertEqual(result.count, 3)
	}

	func testContains_string_caseSensitive() {
		let predicate = (\Dummy.name).contains("Am", options: [])
		let result = array.filtered(using: predicate)
		XCTAssertEqual(result.count, 2)
	}

	func testContains_value() {
		let kp = \Dummy.numbers
		let predicate = kp.contains(23)
		let result = array.filtered(using: predicate)
		XCTAssertEqual(result.count, 1)
	}
}
