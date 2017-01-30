//
//  File.swift
//  Coolspot
//
//  Created by Tino Heth on 29.12.14.
//  Copyright (c) 2014 Tino Heth. All rights reserved.
//

import Foundation

public extension NSComparisonPredicate {
	public class func propertyEqual<T: Equatable>(key: String, _ value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .direct, type: .equalTo, options: [])
	}
	
	public class func propertyNotEqual<T: Equatable>(key: String, _ value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .direct, type: .notEqualTo, options: [])
	}
	
	public class func propertyLessOrEqual<T: Comparable>(key: String, _ value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .direct, type: .lessThanOrEqualTo, options: [])
	}

	public class func propertyLess<T: Comparable>(key: String, _ value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .direct, type: .lessThan, options: [])
	}
	
	public class func propertyGreaterOrEqual<T: Comparable>(key: String, _ value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .direct, type: .greaterThanOrEqualTo, options: [])
	}

	public class func propertyGreater<T: Comparable>(key: String, _ value: T) -> NSComparisonPredicate {
		let left = NSExpression(forKeyPath: key)
		let right = NSExpression(forConstantValue: value)
		return NSComparisonPredicate(leftExpression: left, rightExpression: right, modifier: .direct, type: .greaterThan, options: [])
	}
}

precedencegroup NSPredicateCombination {
	associativity: left
	lowerThan: AdditionPrecedence
	higherThan: LogicalConjunctionPrecedence
}

infix operator ?= : NSPredicateCombination
public func ?= <T: Equatable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyEqual(key: key, value)
}

infix operator ?<> : NSPredicateCombination
public func ?<> <T: Equatable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyNotEqual(key: key, value)
}
infix operator ≠ : NSPredicateCombination
public func ≠ <T: Equatable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyNotEqual(key: key, value)
}

//infix operator ?< : NSPredicateCombination
public func < <T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyLess(key: key, value)
}

//infix operator ?<= : NSPredicateCombination
public func <= <T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyLessOrEqual(key: key, value)
}

//infix operator ?> : NSPredicateCombination
public func > <T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyGreater(key: key, value)
}

//infix operator ?>= : NSPredicateCombination
public func >= <T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyGreaterOrEqual(key: key, value)
}
