//
//  NSPredicateSwiftedTests.swift
//  NSPredicateSwiftedTests
//
//  Created by Tino Heth on 10.01.15.
//  Copyright (c) 2015 Tino Heth. All rights reserved.
//

import UIKit
import XCTest

class NSPredicateSwiftedTests: XCTestCase {
	
	let intArray: NSArray = [
		["value":0, "name":"Paris"],
		["value":1, "name":"Rome"],
		["value":-1, "name":"Rome", "comment":"target"],
		["value":55]
	]
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
	func testLess() {
		let predicate = "value" ?< 0
		let result = intArray.filteredArrayUsingPredicate(predicate)
		XCTAssert(result.count == 1, "Wrong result filtering <")
	}
	
	func testMoreOrEqual() {
		let predicate = "value" ?>= 0
		let result = intArray.filteredArrayUsingPredicate(predicate)
		XCTAssert(result.count == 3, "Wrong result filtering <")
	}
	
	func testLessAndEqual() {
		let a = "value" ?< 0
		let b = "name" ?= "Rome"
		let predicate = a && b
		let result = intArray.filteredArrayUsingPredicate(predicate)
		XCTAssert(result.count == 1, "Wrong result filtering < and ==")
	}
	
	func testLessAndEqualCombined() {
		let predicate = "value" ?< 0 && "name" ?= "Rome"
		let result = intArray.filteredArrayUsingPredicate(predicate)
		XCTAssert(result.count == 1, "Wrong result filtering < and ==")
		let selection = result.last as NSDictionary
		XCTAssert(selection["comment"]?.description == "target", "\(selection)")
	}
	
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }
	
}
