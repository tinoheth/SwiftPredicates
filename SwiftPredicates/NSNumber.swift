//
//  NSNumber.swift
//  SwiftPredicates
//
//  Created by Tino Heth on 10.01.15.
//  Copyright (c) 2015 Tino Heth. All rights reserved.
//

import Foundation

public func ==(a: NSNumber, b: NSNumber) -> Bool {
	return a.compare(b) == NSComparisonResult.OrderedSame
}

public func <(a: NSNumber, b: NSNumber) -> Bool {
	return a.compare(b) == NSComparisonResult.OrderedAscending
}

extension NSNumber: Comparable {}
