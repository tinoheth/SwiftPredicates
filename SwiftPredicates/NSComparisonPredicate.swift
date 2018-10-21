//  Created by Tino Heth on 29.12.14.
//  Copyright (c) 2014 Tino Heth. All rights reserved.
//
import Foundation

public extension NSComparisonPredicate {
	public convenience init<LHS: ExpressionSource, RHS: ExpressionSource>(_ lhs: LHS, _ rhs: RHS, operator: NSComparisonPredicate.Operator) where LHS.Destination == RHS.Destination {
		self.init(leftExpression: lhs.expression, rightExpression: rhs.expression, modifier: .direct, type: `operator`, options: [])
	}

	public convenience init<LHS: ExpressionSource, RHS: ExpressionSource>(_ lhs: LHS, _ rhs: RHS, operator: NSComparisonPredicate.Operator) where LHS.Destination == RHS.Destination? {
		self.init(leftExpression: lhs.expression, rightExpression: rhs.expression, modifier: .direct, type: `operator`, options: [])
	}

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

//infix operator ?= : NSPredicateCombination
public func == <LHS: ExpressionSource, RHS: ExpressionSource>(lhs: LHS, rhs: RHS) -> NSComparisonPredicate where LHS.Destination == RHS.Destination, LHS.Destination: Equatable {
	return NSComparisonPredicate(lhs, rhs, operator: .equalTo)
}

public func == <LHS: ExpressionSource, RHS: ExpressionSource>(lhs: LHS, rhs: RHS) -> NSComparisonPredicate where LHS.Destination == RHS.Destination?, RHS.Destination: Equatable {
	return NSComparisonPredicate(lhs, rhs, operator: .equalTo)
}

public func == <LHS: ExpressionSource, RHS: ExpressionSource>(lhs: LHS, rhs: RHS) -> NSComparisonPredicate where RHS.Destination == LHS.Destination?, LHS.Destination: Equatable {
	return NSComparisonPredicate(rhs, lhs, operator: .equalTo)
}

public func == (lhs: String, rhs: String) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyEqual(key: lhs, rhs)
}

infix operator ≠ : NSPredicateCombination
public func ≠ <T: Equatable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyNotEqual(key: key, value)
}

public func ≠ <LHS: ExpressionSource, RHS: ExpressionSource>(lhs: LHS, rhs: RHS) -> NSComparisonPredicate where LHS.Destination == RHS.Destination, LHS.Destination: Comparable {
	return NSComparisonPredicate(lhs, rhs, operator: .notEqualTo)
}

//infix operator ?< : NSPredicateCombination
public func < <LHS: ExpressionSource, RHS: ExpressionSource>(lhs: LHS, rhs: RHS) -> NSComparisonPredicate where LHS.Destination == RHS.Destination, LHS.Destination: Comparable {
	return NSComparisonPredicate(lhs, rhs, operator: .lessThan)
}

public func < <T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyLess(key: key, value)
}

//infix operator ?<= : NSPredicateCombination
public func <= <LHS: ExpressionSource, RHS: ExpressionSource>(lhs: LHS, rhs: RHS) -> NSComparisonPredicate where LHS.Destination == RHS.Destination, LHS.Destination: Comparable {
	return NSComparisonPredicate(lhs, rhs, operator: .lessThanOrEqualTo)
}

public func <= <T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyLessOrEqual(key: key, value)
}

//infix operator ?> : NSPredicateCombination
public func > <LHS: ExpressionSource, RHS: ExpressionSource>(lhs: LHS, rhs: RHS) -> NSComparisonPredicate where LHS.Destination == RHS.Destination, LHS.Destination: Comparable {
	return NSComparisonPredicate(lhs, rhs, operator: .greaterThan)
}

public func > <T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyGreater(key: key, value)
}

//infix operator ?>= : NSPredicateCombination
public func >= <LHS: ExpressionSource, RHS: ExpressionSource>(lhs: LHS, rhs: RHS) -> NSComparisonPredicate where LHS.Destination == RHS.Destination, LHS.Destination: Comparable {
	return NSComparisonPredicate(lhs, rhs, operator: .greaterThanOrEqualTo)
}

public func >= <T: Comparable>(key: String, value: T) -> NSComparisonPredicate {
	return NSComparisonPredicate.propertyGreaterOrEqual(key: key, value)
}
