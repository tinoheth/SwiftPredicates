//  Created by Tino Heth on 20.10.18.
//  Copyright © 2018 Tino Heth. All rights reserved.
//

import Foundation

extension KeyPath: ExpressionSource where Root: NSObjectProtocol {
	public typealias Destination = Value
	public var expression: NSExpression {
		return NSExpression(forKeyPath: self)
	}
}

public extension KeyPath where Root: NSObjectProtocol, Value: Collection, Value.Element: ExpressionSource {
	func contains(_ value: Value.Element, options: NSComparisonPredicate.Options = []) -> NSComparisonPredicate {
		return NSComparisonPredicate(leftExpression: self.expression, rightExpression: value.expression, modifier: .direct, type: .contains, options: options)
	}
}

public extension KeyPath where Root: NSObjectProtocol, Value == String {
	func contains(_ string: String, options: NSComparisonPredicate.Options = [.caseInsensitive]) -> NSComparisonPredicate {
		return NSComparisonPredicate(leftExpression: self.expression, rightExpression: string.expression, modifier: .direct, type: .contains, options: options)
	}

	func like(_ string: String, options: NSComparisonPredicate.Options = [.caseInsensitive]) -> NSComparisonPredicate {
		return NSComparisonPredicate(leftExpression: self.expression, rightExpression: string.expression, modifier: .direct, type: .like, options: options)
	}

	func matches(_ string: String, options: NSComparisonPredicate.Options = [.caseInsensitive]) -> NSComparisonPredicate {
		return NSComparisonPredicate(leftExpression: self.expression, rightExpression: string.expression, modifier: .direct, type: .matches, options: options)
	}
}

public extension KeyPath where Root: NSObjectProtocol, Value == String? {
	func contains(_ string: String, options: NSComparisonPredicate.Options = [.caseInsensitive]) -> NSComparisonPredicate {
		return NSComparisonPredicate(leftExpression: self.expression, rightExpression: string.expression, modifier: .direct, type: .contains, options: options)
	}

	func like(_ string: String, options: NSComparisonPredicate.Options = [.caseInsensitive]) -> NSComparisonPredicate {
		return NSComparisonPredicate(leftExpression: self.expression, rightExpression: string.expression, modifier: .direct, type: .like, options: options)
	}

	func matches(_ string: String, options: NSComparisonPredicate.Options = [.caseInsensitive]) -> NSComparisonPredicate {
		return NSComparisonPredicate(leftExpression: self.expression, rightExpression: string.expression, modifier: .direct, type: .matches, options: options)
	}
}
