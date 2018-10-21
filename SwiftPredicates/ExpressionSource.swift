//  Created by Tino Heth on 10.01.15.
//  Copyright (c) 2015 Tino Heth. All rights reserved.
//

import Foundation

public protocol ExpressionSource {
	associatedtype Destination
	var expression: NSExpression { get }
}

extension ExpressionSource {
	public var expression: NSExpression {
		return NSExpression(forConstantValue: self)
	}
}

extension Array: ExpressionSource where Element: ExpressionSource{
	public typealias Destination = Array
}

extension Date: ExpressionSource {
	public typealias Destination = Date
}

extension String: ExpressionSource {
	public typealias Destination = String
}

extension Int: ExpressionSource {
	public typealias Destination = Int
}

extension Int8: ExpressionSource {
	public typealias Destination = Int8
}

extension Int16: ExpressionSource {
	public typealias Destination = Int16
}

extension Int32: ExpressionSource {
	public typealias Destination = Int32
}

extension Int64: ExpressionSource {
	public typealias Destination = Int64
}

extension UInt: ExpressionSource {
	public typealias Destination = UInt
}

extension UInt8: ExpressionSource {
	public typealias Destination = UInt8
}

extension UInt16: ExpressionSource {
	public typealias Destination = UInt16
}

extension UInt32: ExpressionSource {
	public typealias Destination = UInt32
}

extension UInt64: ExpressionSource {
	public typealias Destination = UInt64
}

extension Float80: ExpressionSource {
	public typealias Destination = Float80
}

extension Double: ExpressionSource {
	public typealias Destination = Double
}

extension Float: ExpressionSource {
	public typealias Destination = Float
}

extension NSNumber: Comparable, ExpressionSource {
	public static func <(a: NSNumber, b: NSNumber) -> Bool {
		return a.compare(b) == ComparisonResult.orderedAscending
	}

	public static func ==(a: NSNumber, b: NSNumber) -> Bool {
		return a.compare(b) == ComparisonResult.orderedSame
	}

	public typealias Destination = NSNumber
}

