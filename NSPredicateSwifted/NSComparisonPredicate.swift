//
//  File.swift
//  Coolspot
//
//  Created by Tino Heth on 29.12.14.
//  Copyright (c) 2014 Tino Heth. All rights reserved.
//

import Foundation

public func ==(a: NSNumber, b: NSNumber) -> Bool {
	return a.compare(b) == NSComparisonResult.OrderedSame
}

public func <(a: NSNumber, b: NSNumber) -> Bool {
	return a.compare(b) == NSComparisonResult.OrderedAscending
}

extension NSNumber: Comparable {}

extension NSComparisonPredicate {
	class func propertyEqual<T: AnyObject where T: Comparable>(#key: String, value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .DirectPredicateModifier, type: NSPredicateOperatorType.EqualToPredicateOperatorType, options: NSComparisonPredicateOptions.allZeros)
	}
	
	class func propertyNotEqual<T: AnyObject where T: Comparable>(#key: String, value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .DirectPredicateModifier, type: NSPredicateOperatorType.NotEqualToPredicateOperatorType, options: NSComparisonPredicateOptions.allZeros)
	}
	
	class func propertyLessOrEqual<T: AnyObject where T: Comparable>(#key: String, value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .DirectPredicateModifier, type: NSPredicateOperatorType.LessThanOrEqualToPredicateOperatorType, options: NSComparisonPredicateOptions.allZeros)
	}

	class func propertyLess<T: AnyObject where T: Comparable>(#key: String, value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .DirectPredicateModifier, type: NSPredicateOperatorType.LessThanPredicateOperatorType, options: NSComparisonPredicateOptions.allZeros)
	}
	
	class func propertyGreaterOrEqual<T: AnyObject where T: Comparable>(#key: NSString, value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .DirectPredicateModifier, type: NSPredicateOperatorType.GreaterThanOrEqualToPredicateOperatorType, options: NSComparisonPredicateOptions.allZeros)
	}

	class func propertyGreater<T: AnyObject where T: Comparable>(#key: String, value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .DirectPredicateModifier, type: NSPredicateOperatorType.GreaterThanPredicateOperatorType, options: NSComparisonPredicateOptions.allZeros)
	}
}

infix operator ?= { associativity left }
func ?= <T: AnyObject where T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyEqual(key: key, value: value)
}

infix operator ?<> { associativity left }
func ?<> <T: AnyObject where T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyNotEqual(key: key, value: value)
}

infix operator ?< { associativity left }
func ?< <T: AnyObject where T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyLess(key: key, value: value)
}

infix operator ?<= { associativity left }
func ?<= <T: AnyObject where T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyLessOrEqual(key: key, value: value)
}

infix operator ?> { associativity left }
func ?> <T: AnyObject where T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyGreater(key: key, value: value)
}

infix operator ?>= { associativity left }
func ?>= <T: AnyObject where T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyGreaterOrEqual(key: key, value: value)
}
